my $filenameIn="..\\qudao_config.txt";
my $apkName=$ARGV[0];
my $apkVersion=$ARGV[1];
my $project=$ARGV[2];
my $originTag=$ARGV[3];
my $keyname=$ARGV[4];
my $keypass=$ARGV[5];
my $keystore=$ARGV[6];

my $resultFileName="result.txt";
my $result="";

open (FILEIN, "<$filenameIn") || die "Cant open file $filenameIn : $!\n";
foreach $line (<FILEIN>)
{
	chomp($line);
	if($line =~ /#/)
	{
		next;
	}
	if($line =~ /(\S)+/)
	{
		my $appName = $line."_$apkName"."_$apkVersion";
		system("hj_package $appName $project $originTag $line $keyname $keypass $keystore $apkName");
		open (RESULT_FILE_IN, "<$resultFileName") || die "Cant open file $resultFileName: $!\n";
		$result = <RESULT_FILE_IN>;
		close (RESULT_FILE_IN);
		unlink($resultFileName);
		if($result =~ /fail/)
		{
			last;
		}
	}
}
close (FILEIN);

if($result =~ /fail/)
{
	exit(1);
}
else
{
	exit(0);
}

#my @array;
#for($i=0; $i<=$#array; $i++)
#{
#	system("$array[$i]");
#}