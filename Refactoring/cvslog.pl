#!/usr/bin/perl

  use File::List;

  my $search = new File::List(".");

  $search->show_empty_dirs();                   # toggle include empty directories in output
  $search->show_only_dirs();

  my @files  = @{ $search->find("\*.*\$") };    # find all perl scripts in /usr/local

  $clog = "";

  foreach $file (@files) {

	#print $file."\n";

	$cvslog = `cvs log $file`;


open FILE, ">>out.txt";
                #@lines = <FILE>;
print FILE $cvslog;                
close FILE;


  }

