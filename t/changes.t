#!perl
#===============================================================================
#
# t/changes.t
#
# DESCRIPTION
#   Test script to check CPAN::Changes conformance.
#
# COPYRIGHT
#   Copyright (C) 2014 Steve Hay.  All rights reserved.
#
# LICENCE
#   You may distribute under the terms of either the GNU General Public License
#   or the Artistic License, as specified in the LICENCE file.
#
#===============================================================================

use 5.008001;

use strict;
use warnings;

use Test::More;

#===============================================================================
# MAIN PROGRAM
#===============================================================================

MAIN: {
    plan skip_all => 'Author testing only' unless $ENV{AUTHOR_TESTING};

    my $ok = eval {
        require Test::CPAN::Changes;
        Test::CPAN::Changes->import();
        1;
    };

    if (not $ok) {
        plan skip_all => 'Test::CPAN::Changes required to test Changes';
    }
    else {
        changes_ok();
    }
}

#===============================================================================
