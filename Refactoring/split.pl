#!/usr/bin/perl

use File::Basename;

use strict;

my $path = "/navs/contact-me-header.jpg";
# get full path in $path
my $filename = basename($path);

print $filename."\n";
print dirname($path);
