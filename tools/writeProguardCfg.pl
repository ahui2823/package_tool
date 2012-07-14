my $jarFileNameIn=$ARGV[0];
my $projectName=$ARGV[1]."_proguard.map";
my $filenameIn="proguardBase.cfg";
my $filenameOut="proguard.cfg";

open (FILEOUT, ">$filenameOut") || die "Cant open file $filenameOut : $!\n";
open (FILEIN, "<$filenameIn") || die "Cant open file $filenameIn : $!\n";

foreach $line (<FILEIN>)
{
	chomp($line);
	if($line =~ /proguard.map/)
	{
		$line =~ s/(.*)(proguard\.map)(.*)/$1$projectName$3/g;
	}
	print FILEOUT "$line \n";
}
close(FILEIN);
close(FILEOUT);

open (FILEOUT, ">>$filenameOut") || die "Cant open file $filenameOut : $!\n";
open (JARFILEIN, "<$jarFileNameIn") || die "Cant open file $jarFileNameIn : $!\n";
foreach $line (<JARFILEIN>)
{
	chomp($line);
	print FILEOUT "-libraryjars $line\n";
}
close(JARFILEIN);
close(FILEOUT);
unlink($jarFileNameIn);