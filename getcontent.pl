#!/usr/bin/perl -w

use warnings;
use strict;
use HTML::TokeParser::Simple;

chdir "oldfiles/ChurchWebsite";

#my $flist = `ls -l *.html`;

my @files = `ls -1 *.html`;

my $parser;
my $f;
my $content;

foreach $f (@files) {

	chomp $f;
	open(INFILE, "<$f") or die("INFILE FAIL!");
	$f .= ".erb";
	open(OUTFILE, ">$f") or die("OUTFILE FAIL!");

#	print $f;

#$content = "";

#while(<INFILE>) {
#	$content .= $_;
#}


#	while ($content =~ /.*?id="content">(.*?)/s ) {#<\/div>\n<\/div>\n<\/body>.*?/s) {
#		print OUTFILE $1;
#	}

	$parser = HTML::TokeParser::Simple->new(INFILE);
	
	while (my $div = $parser->get_tag('div')) {
		my $id = $div->get_attr('id');
		next unless defined($id) and $id eq 'content';
		
		my $content = $div->get_trimmed_text;
		print OUTFILE $content;
	}

	close INFILE;
	close OUTFILE;

}

