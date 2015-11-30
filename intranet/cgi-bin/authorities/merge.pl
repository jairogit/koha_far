#!/usr/bin/perl

# Copyright 2013 C & P Bibliography Services
#
# This file is part of Koha.
#
# Koha is free software; you can redistribute it and/or modify it under the
# terms of the GNU General Public License as published by the Free Software
# Foundation; either version 3 of the License, or (at your option) any later
# version.
#
# Koha is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with Koha; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

use strict;
use warnings;
use CGI;
use C4::Output;
use C4::Auth;
use C4::AuthoritiesMarc;
use Koha::Authority;
use C4::Koha;
use C4::Biblio;

my $input  = new CGI;
my @authid = $input->param('authid');
my $merge  = $input->param('merge');

my @errors;

my ( $template, $loggedinuser, $cookie ) = get_template_and_user(
    {
        template_name   => "authorities/merge.tt",
        query           => $input,
        type            => "intranet",
        authnotrequired => 0,
        flagsrequired   => { editauthorities => 1 },
    }
);

#------------------------
# Merging
#------------------------
if ($merge) {

    # Creating a new record from the html code
    my $record   = TransformHtmlToMarc($input);
    my $recordid1   = $input->param('recordid1');
    my $recordid2   = $input->param('recordid2');
    my $typecode = $input->param('frameworkcode');

    # Rewriting the leader
    $record->leader( GetAuthority($recordid1)->leader() );

    # Modifying the reference record
    ModAuthority( $recordid1, $record, $typecode );

    # Deleting the other record
    if ( scalar(@errors) == 0 ) {

        my $error;
        if ($input->param('mergereference') eq 'breeding') {
            require C4::ImportBatch;
            C4::ImportBatch::SetImportRecordStatus( $recordid2, 'imported' );
        } else {
            C4::AuthoritiesMarc::merge( $recordid2, GetAuthority($recordid2), $recordid1, $record );
            $error = (DelAuthority($recordid2) == 0);
        }
        push @errors, $error if ($error);
    }

    # Parameters
    $template->param(
        result  => 1,
        recordid1 => $recordid1
    );

    #-------------------------
    # Show records to merge
    #-------------------------
}
else {
    my $mergereference = $input->param('mergereference');
    $template->{'VARS'}->{'mergereference'} = $mergereference;

    if ( scalar(@authid) != 2 ) {
        push @errors, { code => "WRONG_COUNT", value => scalar(@authid) };
    }
    else {
        my $recordObj1 = Koha::Authority->get_from_authid($authid[0]) || Koha::Authority->new();
        my $recordObj2;

        if (defined $mergereference && $mergereference eq 'breeding') {
            $recordObj2 =  Koha::Authority->get_from_breeding($authid[1]) || Koha::Authority->new();
        } else {
            $recordObj2 =  Koha::Authority->get_from_authid($authid[1]) || Koha::Authority->new();
        }

        if ($mergereference) {

            my $framework;
            if ( $recordObj1->authtype ne $recordObj2->authtype && $mergereference ne 'breeding' ) {
                $framework = $input->param('frameworkcode')
                  or push @errors, { code => 'FRAMEWORK_NOT_SELECTED' };
            }
            else {
                $framework = $recordObj1->authtype;
            }
            if ($mergereference eq 'breeding') {
                $mergereference = $authid[0];
            }

            # Getting MARC Structure
            my $tagslib = GetTagsLabels( 1, $framework );
            foreach my $field ( keys %$tagslib ) {
                if ( defined $tagslib->{$field}->{'tab'} && $tagslib->{$field}->{'tab'} eq ' ' ) {
                    $tagslib->{$field}->{'tab'} = 0;
                }
            }

            #Setting $notreference
            my $notreference = $authid[1];
            if($mergereference == $notreference){
                $notreference = $authid[0];
                #Swap so $recordObj1 is always the correct merge reference
                ($recordObj1, $recordObj2) = ($recordObj2, $recordObj1);
            }

            # Creating a loop for display

            my @record1 = $recordObj1->createMergeHash($tagslib);
            my @record2 = $recordObj2->createMergeHash($tagslib);

            # Parameters
            $template->param(
                recordid1        => $mergereference,
                recordid2        => $notreference,
                record1        => @record1,
                record2        => @record2,
                framework      => $framework,
            );
        }
        else {

            # Ask the user to choose which record will be the kept
            $template->param(
                choosereference => 1,
                recordid1         => $authid[0],
                recordid2         => $authid[1],
                title1          => $recordObj1->authorized_heading,
                title2          => $recordObj2->authorized_heading,
            );
            if ( $recordObj1->authtype ne $recordObj2->authtype ) {
                my $frameworks = getauthtypes;
                my @frameworkselect;
                foreach my $thisframeworkcode ( keys %$frameworks ) {
                    my %row = (
                        value => $thisframeworkcode,
                        frameworktext =>
                          $frameworks->{$thisframeworkcode}->{'authtypetext'},
                    );
                    if ( $recordObj1->authtype eq $thisframeworkcode ) {
                        $row{'selected'} = 1;
                    }
                    push @frameworkselect, \%row;
                }
                $template->param(
                    frameworkselect => \@frameworkselect,
                    frameworkcode1  => $recordObj1->authtype,
                    frameworkcode2  => $recordObj2->authtype,
                    frameworklabel1 => $frameworks->{$recordObj1->authtype}->{'authtypetext'},
                    frameworklabel2 => $frameworks->{$recordObj2->authtype}->{'authtypetext'},
                );
            }
        }
    }
}

my $authtypes = getauthtypes;
my @authtypesloop;
foreach my $thisauthtype (
    sort {
        $authtypes->{$a}{'authtypetext'} cmp $authtypes->{$b}{'authtypetext'}
    }
    keys %$authtypes
  )
{
    my %row = (
        value        => $thisauthtype,
        authtypetext => $authtypes->{$thisauthtype}{'authtypetext'},
    );
    push @authtypesloop, \%row;
}
$template->{VARS}->{authtypesloop} = \@authtypesloop;

if (@errors) {

    # Errors
    $template->param( errors => \@errors );
}

output_html_with_http_headers $input, $cookie, $template->output;
exit;

=head1 FUNCTIONS

=cut

# ------------------------
# Functions
# ------------------------
