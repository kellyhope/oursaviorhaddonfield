#!/usr/bin/perl -w

use warnings;
use strict;

#my $flist = `ls -l *.html`;

my @files = `ls -1 *.html`;

my $f;

foreach $f (@files) {

	#chomp $f;
	`echo "$f" > file`;
	`Java ParseFiles < file`;

#	$content .= $_;
#}


#	while ($content =~ /.*?id="content">(.*?)/s ) {#<\/div>\n<\/div>\n<\/body>.*?/s) {
#		print OUTFILE $1;
#	}


}

