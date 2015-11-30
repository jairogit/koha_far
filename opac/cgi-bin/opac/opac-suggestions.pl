#!/usr/bin/perl

# This file is part of Koha.
#
# Koha is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# (at your option) any later version.
#
# Koha is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Koha; if not, see <http://www.gnu.org/licenses>.

use strict;
use warnings;

use CGI;
use C4::Auth;    # get_template_and_user
use C4::Members;
use C4::Branch;
use C4::Koha;
use C4::Output;
use C4::Suggestions;
use C4::Koha;
use C4::Dates;
use C4::Scrubber;

use Koha::DateUtils qw( dt_from_string );

my $input           = new CGI;
my $op              = $input->param('op');
my $suggestion      = $input->Vars;
delete $suggestion->{negcap};
my $negcaptcha      = $input->param('negcap');
my $suggested_by_anyone = $input->param('suggested_by_anyone') || 0;

# If a spambot accidentally populates the 'negcap' field in the sugesstions form, then silently skip and return.
if ($negcaptcha ) {
    print $input->redirect("/cgi-bin/koha/opac-suggestions.pl");
    exit;
}

#If suggestions are turned off we redirect to 404 error. This will also redirect guest suggestions
if ( ! C4::Context->preference('suggestion') ) {
    print $input->redirect("/cgi-bin/koha/errors/404.pl");
    exit;
}

delete $suggestion->{$_} foreach qw<op suggested_by_anyone>;
$op = 'else' unless $op;

my ( $template, $borrowernumber, $cookie, @messages );
my $deleted = $input->param('deleted');
my $submitted = $input->param('submitted');

if ( C4::Context->preference("AnonSuggestions") or ( C4::Context->preference("OPACViewOthersSuggestions") and $op eq 'else' ) ) {
    ( $template, $borrowernumber, $cookie ) = get_template_and_user(
        {
            template_name   => "opac-suggestions.tt",
            query           => $input,
            type            => "opac",
            authnotrequired => ( C4::Context->preference("OpacPublic") ? 1 : 0 ),
        }
    );
}
else {
    ( $template, $borrowernumber, $cookie ) = get_template_and_user(
        {
            template_name   => "opac-suggestions.tt",
            query           => $input,
            type            => "opac",
            authnotrequired => 0,
        }
    );
}

if ( $op eq 'else' ) {
    if ( C4::Context->preference("OPACViewOthersSuggestions") ) {
        if ( $borrowernumber ) {
            # A logged in user is able to see suggestions from others
            $suggestion->{suggestedby} = $suggested_by_anyone
                ? undef
                : $borrowernumber;
        }
        else {
            # Non logged in user is able to see all suggestions
            $suggestion->{suggestedby} = undef;
        }
    }
    else {
        if ( $borrowernumber ) {
            $suggestion->{suggestedby} = $borrowernumber;
        }
        else {
            $suggestion->{suggestedby} = -1;
        }
    }
} else {
    if ( $borrowernumber ) {
        $suggestion->{suggestedby} = $borrowernumber;
    }
    else {
        $suggestion->{suggestedby} = C4::Context->preference("AnonymousPatron");
    }
}

my $suggestions_loop =
  &SearchSuggestion( $suggestion);
if ( $op eq "add_confirm" ) {
	if (@$suggestions_loop>=1){
		#some suggestion are answering the request Donot Add
        for my $suggestion ( @$suggestions_loop ) {
            push @messages, { type => 'error', code => 'already_exists', id => $suggestion->{suggestionid} };
            last;
        }
	}
	else {
		my $scrubber = C4::Scrubber->new();
		foreach my $suggest (keys %$suggestion){
		    $suggestion->{$suggest} = $scrubber->scrub($suggestion->{$suggest});
		}
        $suggestion->{suggesteddate} = dt_from_string;
        $suggestion->{branchcode} = $input->param('branchcode') || C4::Context->userenv->{"branch"};

		&NewSuggestion($suggestion);
		# empty fields, to avoid filter in "SearchSuggestion"
		$$suggestion{$_}='' foreach qw<title author publishercode copyrightdate place collectiontitle isbn STATUS>;
		$suggestions_loop =
		   &SearchSuggestion( $suggestion );
        push @messages, { type => 'info', code => 'success_on_inserted' };
	}
    $op = 'else';
}

if ( $op eq "delete_confirm" ) {
    my @delete_field = $input->param("delete_field");
    foreach my $delete_field (@delete_field) {
        &DelSuggestion( $borrowernumber, $delete_field );
    }
    $op = 'else';
    print $input->redirect("/cgi-bin/koha/opac-suggestions.pl?op=else");
    exit;
}
map{ $_->{'branchcodesuggestedby'}=GetBranchInfo($_->{'branchcodesuggestedby'})->[0]->{'branchname'}} @$suggestions_loop;
my $supportlist=GetSupportList();
foreach my $support(@$supportlist){
	if ($$support{'imageurl'}){
		$$support{'imageurl'}= getitemtypeimagelocation( 'opac', $$support{'imageurl'} );
	}
	else {
	   delete $$support{'imageurl'}
	}
}

foreach my $suggestion(@$suggestions_loop) {
    if($suggestion->{'suggestedby'} == $borrowernumber) {
        $suggestion->{'showcheckbox'} = $borrowernumber;
    } else {
        $suggestion->{'showcheckbox'} = 0;
    }
    if($suggestion->{'patronreason'}){
        $suggestion->{'patronreason'} = GetKohaAuthorisedValueLib("OPAC_SUG",$suggestion->{'patronreason'},1);
    }
}

my $patron_reason_loop = GetAuthorisedValues("OPAC_SUG");

# Is the person allowed to choose their branch
if ( C4::Context->preference("AllowPurchaseSuggestionBranchChoice") ) {
    my ( $borr ) = GetMemberDetails( $borrowernumber );

# pass the pickup branch along....
    my $userbranch = '';
    if (C4::Context->userenv && C4::Context->userenv->{'branch'}) {
        $userbranch = C4::Context->userenv->{'branch'};
    }
    my $branchcode = $input->param('branchcode') || $borr->{'branchcode'} || $userbranch || '' ;

# make branch selection options...
    my $branchloop = GetBranchesLoop($branchcode);
    $template->param( branchloop => $branchloop );
}

$template->param(
	%$suggestion,
	itemtypeloop=> $supportlist,
    suggestions_loop => $suggestions_loop,
    patron_reason_loop => $patron_reason_loop,
    "op_$op"         => 1,
    $op => 1,
    messages => \@messages,
    suggestionsview => 1,
    suggested_by_anyone => $suggested_by_anyone,
);

output_html_with_http_headers $input, $cookie, $template->output;

