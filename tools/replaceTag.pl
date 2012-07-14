my $project=$ARGV[0];
my $filenameIn=$project."/TempAndroidManifest.xml";
my $filenameOut=$project."/AndroidManifest.xml";
my $originTag=$ARGV[1];
my $replaceTag=$ARGV[2];
open (FILEIN, "<$filenameIn") || die "Cant open file $filenameIn : $!\n";
open (FILEOUT, ">$filenameOut") || die "Cant open file $filenameOut : $!\n";

foreach $line (<FILEIN>)
{
	chomp($line);
	if($line =~ /$originTag/)
	{
		$line =~ s/$originTag/$replaceTag/g;
	}
	print FILEOUT "$line \n";
}

close(FILEIN);
close(FILEOUT);