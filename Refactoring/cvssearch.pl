#!/usr/bin/perl
#use strict;
#use warnings;

#die ("Usage: $0 [-v] [-q] [-o filename] file [file ...]\n");

	# cvs log -N

	open F, $ARGV[0] or print "couldn't open $ARGV[0]\n" && return;

	@lines = <F>;

	$total_lines = @lines;

	$ctr = 0;

	foreach $line (@lines) {

		$ctr++;
		
		if ($line =~ /$ARGV[1] -/) {

			$found = 0;
			$prev_line = $ctr;

			while ($found != 1) {

				$cur_line = $lines[$prev_line--];

				if ( $cur_line =~ /.*Working file:\s(.*)/ ) {
					
					#print $cur_line."\n";
					print $1."\n";
					$found = 1;
				}

			}

		}
	
	}

	close F;