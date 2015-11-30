#!/usr/bin/perl

# Copyright (C) 2007 LibLime
#
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
#use warnings; FIXME - Bug 2505

# standard or CPAN modules used
use IO::File;
use CGI;
use CGI::Session;
use C4::Context;
use C4::Auth qw/check_cookie_auth haspermission/;
use C4::UploadedFile;
use CGI::Cookie; # need to check cookies before
                 # having CGI parse the POST request

my $flags_required = [
    {circulate => 'circulate_remaining_permissions'},
    {tools => 'stage_marc_import'},
    {tools => 'upload_local_cover_images'}
];

my %cookies = fetch CGI::Cookie;

my ($auth_status, $sessionID) = check_cookie_auth($cookies{'CGISESSID'}->value);

my $auth_failure = 1;
foreach my $flag_required (@{ $flags_required}) {
    if (my $flags = haspermission(C4::Context->config('user'), $flag_required)) {
        $auth_failure = 0 if $auth_status eq 'ok';
    }
}

if ($auth_failure) {
    my $reply = CGI->new("");
    print $reply->header(-type => 'text/html');
    print '{"progress":"0"}';
    exit 0;
}

my $reported_progress = C4::UploadedFile->upload_progress($sessionID);

my $reply = CGI->new("");
print $reply->header(-type => 'text/html');
# response will be sent back as JSON
print '{"progress":"' . $reported_progress . '"}';
