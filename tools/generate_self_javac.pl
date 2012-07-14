my $jdkVersion=$ARGV[0];
my $androidJar=$ARGV[1];
my $externerJar=$ARGV[2];
my $androidProject=$ARGV[3];
my $filenameOut=$ARGV[4];

my $androidProjectSrc="";
open (FILEIN, "<$filenameOut") || die "Cant open file $filenameOut : $!\n";
foreach $line (<FILEIN>)
{
	chomp($line);
	$androidProjectSrc = $androidProjectSrc."$line ";
}
close(FILEIN);

my $batFile="self_javac.bat";
open (FILEOUT, ">$batFile") || die "Cant open file $batFile : $!\n";
print FILEOUT "\@echo off \n";
print FILEOUT "pushd $androidProject \n";
print FILEOUT "javac -encoding UTF-8 -source $jdkVersion -bootclasspath $androidJar -classpath $externerJar -d bin $androidProjectSrc \n";
print FILEOUT "set result=%errorlevel% \npopd\nexit /B %result%";
close(FILEOUT);

unlink("$filenameOut");