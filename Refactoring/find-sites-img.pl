#!/usr/bin/perl
use File::Find;

$loc = "c:/development/workspace-ls/";

@dirs = (
	"ls-sites"
	);

$filespec = ".jsp";

$regex = "<sites:img src=";
#$rep   = \u0022;

$filectr = 0;
$instanceCtr = 0;
$linectr = 0;
$ctr = 0;
$totInstances = 0;
$lineNum = 0;

foreach $dir (@dirs) {

	print "\nProcessing $dir ...\n\n";

	find(\&infiles, $loc.$dir);

	print "$filectr files searched.\n";
	print "$instanceCtr instances of regex found.\n";

	$totInstances += $instanceCtr;
	$lineNum = 0;
	$filectr = 0;
	$instanceCtr = 0;
}

print "\n----------------------\nTotal instances: $totInstances\n";

sub infiles() {

	# skip directories
	if ( -f and /$filespec/ ) {

		$file = $_;
		$linectr = 0;
		$filectr++;

		open FILE, $file;
		@lines = <FILE>;
		close FILE;

		for $line ( @lines ) {

			$linectr++;
			
			#if ($line =~ s/$regex/$rep/g) {
			#if ($line =~ m/$regex/) {
			if ($line =~ /$regex/) {


				my $string = $line; #"abe[123955785ada]sdjdjajd";
				if ( $string =~ /<sites:img src=\"(.*?)\"/ )
				{
  					my $inside = $1;
    					print $inside, "\n";
					my $cmd = "perl ~/src/perl/si.pl 4 $inside";
				 	print $cmd."\n";	
					`$cmd`;
				}


				$instanceCtr++;
				$lineNum++;
				$trimmedline = $line;
				$trimmedline =~ s/^\s+//;
			
				#print $trimmedline;
				#my $inside = $1;
				#print $inside;

				#print "$lineNum. $_  $linectr $trimmedline\n";
				#print substr($File::Find::name, length($loc)) . "\t$linectr\t$trimmedline\n";
    		}
		}
	} # if
} # sub
