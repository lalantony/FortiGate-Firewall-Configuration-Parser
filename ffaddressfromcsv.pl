#!/usr/bin/perl
use strict;
use warnings;

my $file = $ARGV[0];
my @data;
my $firstline = 0;
my @columns;
my %dataset;
my @row;

open(my $fh, '<', $file) or die "Can't read file '$file' [$!]\n";
while (my $line = <$fh>) {
    if($firstline == 0){
        #Column Names
        chomp $line;
        @columns = split(/,/, $line);
        $firstline++;
    }else{
        #Each Data Row Processing
        @row = split(/,/, $line);
		my @tmpval = split(/\\n/, $row[3]);
		$row[3] = $tmpval[0];
		print "<div id=\"show_interfaces\">\n";
		print "<p>edit \"$row[0]\"</br>";
		print "set associated-interface \"$row[3]\"</br>";
		print "set subnet $row[1] $row[2]</br>";
		print "next</p>";
		print "</div>\n";
    }
}