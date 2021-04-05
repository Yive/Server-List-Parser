#!/usr/bin/perl
use strict;
use LWP::UserAgent;
binmode STDOUT, ":utf8";
use utf8;
use Data::Dumper;
use Time::HiRes;
use List::MoreUtils qw(uniq);

my ($site) = @ARGV;
if(not defined $site) {
    die;
}

my $agent = 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36';

if($site eq "minecraftservers.org") {
    my $ua = LWP::UserAgent->new( cookie_jar => {}, agent => $agent );
    my @ips;
    for (my $i = 1; $i <= 1656; $i++) {
        my $req = new HTTP::Request GET => 'http://minecraftservers.org/index/'.$i;
        my $res = $ua->request($req);
        my $content = $res->content;
        my @pageIps = ($content =~ /data-clipboard-text="(.*)">/g);
        splice(@ips, 1, 0, @pageIps);
        Time::HiRes::sleep(0.3);
    }
    $_ = lc for @ips;
    s/:.*// for @ips;
    @ips = uniq(@ips);

    foreach my $x (@ips) {
        my $req = new HTTP::Request GET => 'https://ismyserverblocked.com/check/'.$x;
        my $res = $ua->request($req);
        my $content = $res->content;
        print $content."\n";
        Time::HiRes::sleep(0.3);
    }
} elsif($site eq "minecraft-server-list.com") {
    my $ua = LWP::UserAgent->new( cookie_jar => {}, agent => $agent );
    my @ips;
    for (my $i = 1; $i <= 301; $i++) {
        my $req = new HTTP::Request GET => 'http://minecraft-server-list.com/page/'.$i.'/';
        my $res = $ua->request($req);
        my $content = $res->content;
        my @pageIps = ($content =~ /name="serverip" value="(.*)" id=/g);
        splice(@ips, 1, 0, @pageIps);
        Time::HiRes::sleep(0.3);
    }
    $_ = lc for @ips;
    s/:.*// for @ips;
    @ips = uniq(@ips);

    foreach my $x (@ips) {
        my $req = new HTTP::Request GET => 'https://ismyserverblocked.com/check/'.$x;
        my $res = $ua->request($req);
        my $content = $res->content;
        print $content."\n";
        Time::HiRes::sleep(0.3);
    }

} elsif($site eq "minecraft-server.net") {
    my $ua = LWP::UserAgent->new( cookie_jar => {}, agent => $agent );
    my @ips;
    for (my $i = 1; $i <= 98; $i++) {
        my $req = new HTTP::Request GET => 'https://minecraft-server.net/rank/'.$i.'/in/';
        my $res = $ua->request($req);
        my $content = $res->content;
        my @pageIps = ($content =~ /data-serverip="(.*)" data-versionurl=/g);
        splice(@ips, 1, 0, @pageIps);
        Time::HiRes::sleep(0.3);
    }
    $_ = lc for @ips;
    s/:.*// for @ips;
    @ips = uniq(@ips);
    s/'.*// for @ips;

    foreach my $x (@ips) {
        my $req = new HTTP::Request GET => 'https://ismyserverblocked.com/check/'.$x;
        my $res = $ua->request($req);
        my $content = $res->content;
        print $content."\n";
        Time::HiRes::sleep(0.3);
    }
} elsif($site eq "topg.org") {
    my $ua = LWP::UserAgent->new( cookie_jar => {}, agent => $agent );
    my @ips;
    for (my $i = 1; $i <= 112; $i++) {
        my $req = $i == 1 ? new HTTP::Request GET => 'https://topg.org/minecraft-servers/' : new HTTP::Request GET => 'https://topg.org/minecraft-servers/page/'.$i;
        my $res = $ua->request($req);
        my $content = $res->content;
        my @pageIps = ($content =~ /title="Copy (.*) to Clipboard">/g);
        splice(@ips, 1, 0, @pageIps);
        Time::HiRes::sleep(0.3);
    }
    $_ = lc for @ips;
    s/:.*// for @ips;
    @ips = uniq(@ips);

    foreach my $x (@ips) {
        my $req = new HTTP::Request GET => 'https://ismyserverblocked.com/check/'.$x;
        my $res = $ua->request($req);
        my $content = $res->content;
        print $content."\n";
        Time::HiRes::sleep(0.3);
    }
} elsif($site eq "minecraft-mp.com") {
    my $ua = LWP::UserAgent->new( cookie_jar => {}, agent => $agent );
    my @ips;
    for (my $i = 1; $i <= 566; $i++) {
        my $req = new HTTP::Request GET => 'http://minecraft-mp.com/servers/list/'.$i.'/';
        my $res = $ua->request($req);
        my $content = $res->content;
        my @pageIps = ($content =~ /&nbsp;<strong>(.*)<\/strong>/g);
        splice(@ips, 1, 0, @pageIps);
        Time::HiRes::sleep(0.3);
    }
    $_ = lc for @ips;
    s/:.*// for @ips;
    @ips = uniq(@ips);

    foreach my $x (@ips) {
        my $req = new HTTP::Request GET => 'https://ismyserverblocked.com/check/'.$x;
        my $res = $ua->request($req);
        my $content = $res->content;
        print $content."\n";
        Time::HiRes::sleep(0.3);
    }
} elsif($site eq "minelist.net") {
    my $ua = LWP::UserAgent->new( cookie_jar => {}, agent => $agent );
    my @ips;
    for (my $i = 1; $i <= 200; $i++) {
        my $req = new HTTP::Request GET => 'http://minelist.net/page/'.$i;
        my $res = $ua->request($req);
        my $content = $res->content;
        my @pageIps = ($content =~ /"value="(.*)" onclick="if /g);
        splice(@ips, 1, 0, @pageIps);
        Time::HiRes::sleep(0.3);
    }
    $_ = lc for @ips;
    s/:.*// for @ips;
    @ips = uniq(@ips);

    foreach my $x (@ips) {
        my $req = new HTTP::Request GET => 'https://ismyserverblocked.com/check/'.$x;
        my $res = $ua->request($req);
        my $content = $res->content;
        print $content."\n";
        Time::HiRes::sleep(0.3);
    }
} elsif($site eq "mc-servers.com") {
    my $ua = LWP::UserAgent->new( cookie_jar => {}, agent => $agent );
    my @ips;
    for (my $i = 1; $i <= 262; $i++) {
        my $req = new HTTP::Request GET => 'https://mc-servers.com/page/'.$i.'/';
        my $res = $ua->request($req);
        my $content = $res->content;
        my @pageIps = ($content =~ /data-clipboard-text="(.*)" data-position="/g);
        splice(@ips, 1, 0, @pageIps);
        Time::HiRes::sleep(0.3);
    }
    $_ = lc for @ips;
    s/:.*// for @ips;
    @ips = uniq(@ips);
    s/'.*// for @ips;

    foreach my $x (@ips) {
        my $req = new HTTP::Request GET => 'https://ismyserverblocked.com/check/'.$x;
        my $res = $ua->request($req);
        my $content = $res->content;
        print $content."\n";
        Time::HiRes::sleep(0.3);
    }
} elsif($site eq "serveurs-minecraft.com") {
    my $ua = LWP::UserAgent->new( cookie_jar => {}, agent => $agent );
    my @ips;
    for (my $i = 1; $i <= 788; $i++) {
        my $req = new HTTP::Request GET => 'https://www.serveurs-minecraft.com/?page='.$i;
        my $res = $ua->request($req);
        my $content = $res->content;
        my @pageIps = ($content =~ /<span>IP : <\/span><strong>(.*)<\/strong><\/span>/g);
        splice(@ips, 1, 0, @pageIps);
        Time::HiRes::sleep(0.3);
    }
    $_ = lc for @ips;
    s/:.*// for @ips;
    @ips = uniq(@ips);
    s/'.*// for @ips;

    foreach my $x (@ips) {
        my $req = new HTTP::Request GET => 'https://ismyserverblocked.com/check/'.$x;
        my $res = $ua->request($req);
        my $content = $res->content;
        print $content."\n";
        Time::HiRes::sleep(0.3);
    }
} else {
    die;
}
