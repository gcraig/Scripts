#!/usr/bin/perl

use File::Basename;

if (@ARGV < 2) {
    die "usage: si TEMPLATE# DIR/IMG_FILE\n"
}

$templateNum = $ARGV[0];

$imageDir = dirname($ARGV[1]);

$image = basename($ARGV[1]);

@locales = ("en_US", "en_CA");

# Starting in /defaultroot/skins/sites/templateX dir

$home = "C:/development/workspace-ls/ls-sites/defaultroot";

#nav\headers\about-header.jpg";

foreach $locale (@locales) {

	$des = $home."/images/".$locale."/template".$templateNum.$imageDir;

	$src = $home."/skins/sites/template".$templateNum."/images/";

	$src = "$src/$locale/$imageDir/$image";
 
	print "\n\nmkdir -p $des/\n";
	`mkdir -p $des`;

	print "mv $src $des\n";
	`mv $src $des`;

	$des = "";
	$src = "";
}

