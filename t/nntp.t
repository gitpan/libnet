#!./perl -w

use Net::Config;
use Net::NNTP;

unless(@{$NetConfig{nntp_hosts}} && $NetConfig{test_hosts}) {
    print "1..0\n";
    exit 0;
}

print "1..5\n";

my $i = 1;

$nntp = Net::NNTP->new(Debug => 0)
	or (print("not ok 1\n"), exit);

print "ok 1\n";

$list = $nntp->list or print "not ";
print "ok 2\n";

$grp = (keys %$list)[0];

@g = $nntp->group($grp);
print "not " unless @g;
print "ok 3\n";

if($g[1] > $g[2]) {
    $nntp->head($g[1]) or print "not ";
}
print "ok 4\n";


$nntp->quit or print "not ";
print "ok 5\n";

