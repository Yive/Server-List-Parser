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
    for (my $i = 1; $i <= 2186; $i++) {
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
        my $req = new HTTP::Request GET => 'http://use.gameapis.net/mc/extra/blockedservers/check/'.$x;
        my $res = $ua->request($req);
        my $content = $res->content;
        print $content."\n";
        Time::HiRes::sleep(0.3);
    }
} elsif($site eq "minecraft-server-list.com") {
    my $ua = LWP::UserAgent->new( cookie_jar => {}, agent => $agent );
    my @ips;
    for (my $i = 1; $i <= 140; $i++) {
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
        my $req = new HTTP::Request GET => 'http://use.gameapis.net/mc/extra/blockedservers/check/'.$x;
        my $res = $ua->request($req);
        my $content = $res->content;
        print $content."\n";
        Time::HiRes::sleep(0.3);
    }

} elsif($site eq "minecraft-index.com") {
    my $ua = LWP::UserAgent->new( cookie_jar => {}, agent => $agent );
    my @ips;
    for (my $i = 1; $i <= 959; $i++) {
        my $req = new HTTP::Request GET => 'http://www.minecraft-index.com/page'.$i.'/';
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
        my $req = new HTTP::Request GET => 'http://use.gameapis.net/mc/extra/blockedservers/check/'.$x;
        my $res = $ua->request($req);
        my $content = $res->content;
        print $content."\n";
        Time::HiRes::sleep(0.3);
    }
} elsif($site eq "minecraft-server.net") {
    my $ua = LWP::UserAgent->new( cookie_jar => {}, agent => $agent );
    my @ips;
    for (my $i = 1; $i <= 5146; $i+=15) {
        my $req = new HTTP::Request GET => 'https://minecraft-server.net/rank/'.$i.'/in/';
        my $res = $ua->request($req);
        my $content = $res->content;
        my @pageIps = ($content =~ /<input class="sm-form-control tleft copy-ip-trigger copyip" type="text" value="(.*)" data-out.*/g);
        splice(@ips, 1, 0, @pageIps);
        Time::HiRes::sleep(0.3);
    }
    $_ = lc for @ips;
    s/:.*// for @ips;
    @ips = uniq(@ips);
    s/'.*// for @ips;

    foreach my $x (@ips) {
        my $req = new HTTP::Request GET => 'http://use.gameapis.net/mc/extra/blockedservers/check/'.$x;
        my $res = $ua->request($req);
        my $content = $res->content;
        print $content."\n";
        Time::HiRes::sleep(0.3);
    }
} elsif($site eq "topg.org") {
    my $ua = LWP::UserAgent->new( cookie_jar => {}, agent => $agent );
    my @ips;
    for (my $i = 1; $i <= 21351; $i+=50) {
        if($i == 1) {
            my $req = new HTTP::Request GET => 'http://topg.org/Minecraft/';
        } else {
            my $req = new HTTP::Request GET => 'http://topg.org/Minecraft/'.$i.'/';
        }
        my $res = $ua->request($req);
        my $content = $res->content;
        my @pageIps = ($content =~ /"this\.select\(\)" value="(.*)">/g);
        splice(@ips, 1, 0, @pageIps);
        Time::HiRes::sleep(0.3);
    }
    $_ = lc for @ips;
    s/:.*// for @ips;
    @ips = uniq(@ips);

    foreach my $x (@ips) {
        my $req = new HTTP::Request GET => 'http://use.gameapis.net/mc/extra/blockedservers/check/'.$x;
        my $res = $ua->request($req);
        my $content = $res->content;
        print $content."\n";
        Time::HiRes::sleep(0.3);
    }
} elsif($site eq "planetminecraft.com") {

} elsif($site eq "minecraft-mp.com") {
    my $ua = LWP::UserAgent->new( cookie_jar => {}, agent => $agent );
    my @ips;
    for (my $i = 1; $i <= 665; $i++) {
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
        my $req = new HTTP::Request GET => 'http://use.gameapis.net/mc/extra/blockedservers/check/'.$x;
        my $res = $ua->request($req);
        my $content = $res->content;
        print $content."\n";
        Time::HiRes::sleep(0.3);
    }
} elsif($site eq "minelist.net") {
    my $ua = LWP::UserAgent->new( cookie_jar => {}, agent => $agent );
    my @ips;
    for (my $i = 1; $i <= 76; $i++) {
        my $req = new HTTP::Request GET => 'http://minelist.net/'.$i;
        my $res = $ua->request($req);
        my $content = $res->content;
        my @pageIps = ($content =~ /"this\.select\(\)" value="(.*)">/g);
        splice(@ips, 1, 0, @pageIps);
        Time::HiRes::sleep(0.3);
    }
    $_ = lc for @ips;
    s/:.*// for @ips;
    @ips = uniq(@ips);

    foreach my $x (@ips) {
        my $req = new HTTP::Request GET => 'http://use.gameapis.net/mc/extra/blockedservers/check/'.$x;
        my $res = $ua->request($req);
        my $content = $res->content;
        print $content."\n";
        Time::HiRes::sleep(0.3);
    }
} elsif($site eq "minecraftserverlist.eu") {

} elsif($site eq "minecraftforum.net") {
    my $ua = LWP::UserAgent->new( cookie_jar => {}, agent => $agent );
    my @ips;
    for (my $i = 1; $i <= 809; $i++) {
        my $req = new HTTP::Request GET => 'http://www.minecraftforum.net/servers?page='.$i;
        my $res = $ua->request($req);
        my $content = $res->content;
        my @pageIps = ($content =~ /<span id="host-name-.*">(.*)<\/span>/g);
        splice(@ips, 1, 0, @pageIps);
        Time::HiRes::sleep(0.3);
    }
    $_ = lc for @ips;
    s/:.*// for @ips;
    @ips = uniq(@ips);

    foreach my $x (@ips) {
        my $req = new HTTP::Request GET => 'http://use.gameapis.net/mc/extra/blockedservers/check/'.$x;
        my $res = $ua->request($req);
        my $content = $res->content;
        print $content."\n";
        Time::HiRes::sleep(0.3);
    }
} elsif($site eq "minepick.com") {
    my $ua = LWP::UserAgent->new( cookie_jar => {}, agent => $agent );
    my @ips;
    for (my $i = 1; $i <= 981; $i++) {
        my $req = new HTTP::Request GET => 'http://www.minepick.com/page/'.$i.'/';
        my $res = $ua->request($req);
        my $content = $res->content;
        my @pageIps = ($content =~ /value='(.*)'.*ip-box'/g);
        splice(@ips, 1, 0, @pageIps);
        Time::HiRes::sleep(0.3);
    }
    $_ = lc for @ips;
    s/:.*// for @ips;
    @ips = uniq(@ips);
    s/'.*// for @ips;

    foreach my $x (@ips) {
        my $req = new HTTP::Request GET => 'http://use.gameapis.net/mc/extra/blockedservers/check/'.$x;
        my $res = $ua->request($req);
        my $content = $res->content;
        print $content."\n";
        Time::HiRes::sleep(0.3);
    }
} elsif($site eq "mc-servers.com") {
    my $ua = LWP::UserAgent->new( cookie_jar => {}, agent => $agent );
    my @ips;
    for (my $i = 1; $i <= 107; $i++) {
        my $req = new HTTP::Request GET => 'https://mc-servers.com/page/'.$i.'/';
        my $res = $ua->request($req);
        my $content = $res->content;
        my @pageIps = ($content =~ /<input id="copyip" class="ipcopy" readonly="readonly" value="(.*)">/g);
        splice(@ips, 1, 0, @pageIps);
        Time::HiRes::sleep(0.3);
    }
    $_ = lc for @ips;
    s/:.*// for @ips;
    @ips = uniq(@ips);
    s/'.*// for @ips;

    foreach my $x (@ips) {
        my $req = new HTTP::Request GET => 'http://use.gameapis.net/mc/extra/blockedservers/check/'.$x;
        my $res = $ua->request($req);
        my $content = $res->content;
        print $content."\n";
        Time::HiRes::sleep(0.3);
    }
} elsif($site eq "mineservers.com") {

} elsif($site eq "mcserverlist.com") {

} elsif($site eq "minecraft-list.com") {

} elsif($site eq "mcserverstatus.com") {

} elsif($site eq "minecraft-servers-list.net") {

} elsif($site eq "serveurs-minecraft.com") {
    my $ua = LWP::UserAgent->new( cookie_jar => {}, agent => $agent );
    my @ips;
    for (my $i = 1; $i <= 613; $i++) {
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
        my $req = new HTTP::Request GET => 'http://use.gameapis.net/mc/extra/blockedservers/check/'.$x;
        my $res = $ua->request($req);
        my $content = $res->content;
        print $content."\n";
        Time::HiRes::sleep(0.3);
    }
} elsif($site eq "minecraftpeservers.org") {
    # Experimenting with PE servers. Doubt there will be a blacklist involving PE servers, but better safe than sorry.
    my $ua = LWP::UserAgent->new( cookie_jar => {}, agent => $agent );
    my @ips;
    for (my $i = 1; $i <= 53; $i++) {
        my $req = new HTTP::Request GET => 'http://minecraftpeservers.org/index/'.$i;
        my $res = $ua->request($req);
        my $content = $res->content;
        my @pageIps = ($content =~ /<p><span class="icon ip"><\/span>(.*)<\/p>/g);
        splice(@ips, 1, 0, @pageIps);
        Time::HiRes::sleep(0.3);
    }
    $_ = lc for @ips;
    s/:.*// for @ips;
    @ips = uniq(@ips);

    foreach my $x (@ips) {
        my $req = new HTTP::Request GET => 'http://use.gameapis.net/mc/extra/blockedservers/check/'.$x;
        my $res = $ua->request($req);
        my $content = $res->content;
        print $content."\n";
        Time::HiRes::sleep(0.3);
    }
} else {
    die;
}
