my $projectName=$ARGV[0];
my $fullPath=$ARGV[1];
my $source=$ARGV[2];
my $filenameOut=$ARGV[3];

if($source==1)
{
	$fullPath=~ s/(.*\\)(src\\.*)(\\[^(\\)]*\.java)/$2\\\*\.java/gi;
}
else
{
	$fullPath=~ s/(.*\\)(gen\\.*)(\\[^(\\)]*\.java)/$2\\\*\.java/gi;
}

my $num=0;
open (FILEIN, "<$filenameOut");
foreach $line (<FILEIN>)
{
	chomp($line);
	if($line eq $fullPath)
	{
		$num=1;
		last;
	}
}
close(FILEIN);

if($num==0)
{
	open (FILEOUT, ">>$filenameOut") || die "Cant open file $filenameOut : $!\n";
	print FILEOUT "$fullPath\n";
	close(FILEOUT);
}