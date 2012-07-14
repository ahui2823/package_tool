my $env_config_fileName="..\\env_config.txt";
my $javaHome="";
my $android_sdk="";
my $android_version="";
my $jdk_version="";
my $pathName="";
my $pathValue="";

open (CONFIG_FILEIN, "<$env_config_fileName") || die "Cant open file $env_config_fileName: $!\n";
foreach $line (<CONFIG_FILEIN>)
{
	chomp($line);
	if($line =~ /#/)
	{
		next;
	}
	if($line =~ /(\S)+/)
	{
		$line =~ s/(.*)(=)(.*)/$1$2$3/gi;
		$pathName=$1;
		$pathValue=$3;
		if($pathName =~ /jdkPath/gi)
		{
			$javaHome=$pathValue;
			$javaHome =~ s/((\S).*(\S))((\s)*)$/$1/g;
		}
		if($pathName =~ /sdkPath/gi)
		{
			$android_sdk=$pathValue;
			$android_sdk =~ s/((\S).*(\S))((\s)*)$/$1/g;
		}
		if($pathName =~ /androidVersionPath/gi)
		{
			$android_version=$pathValue;
			$android_version =~ s/((\S).*(\S))((\s)*)$/$1/g;
		}
		if($pathName =~ /jdkVersion/gi)
		{
			$jdk_version=$pathValue;
			$jdk_version =~ s/((\S).*(\S))((\s)*)$/$1/g;
		}
	}
}
close(CONFIG_FILEIN);

my $rawPackageFile="package";
my $PackageFile="hj_package.bat";


open (PACK_FILEIN, "<$rawPackageFile") || die "Cant open file $filenameIn : $!\n";
open (PACK_FILEOUT, ">$PackageFile") || die "Cant open file $filenameOut : $!\n";

foreach $line (<PACK_FILEIN>)
{
	chomp($line);
	if($line =~ /\sJavaHome=/i)
	{
		$line = $line.$javaHome;
	}
	if($line =~ /\sAndroidHome=/i)
	{
		$line = $line.$android_sdk;
	}
	if($line =~ /\sAndroidVersion=/i)
	{
		$line = $line.$android_version;
	}
	if($line =~ /\sJDK_Version=/i)
	{
		$line = $line.$jdk_version;
	}
	print PACK_FILEOUT "$line\n";
}

close(PACK_FILEIN);
close(PACK_FILEOUT);


my $rtJarPath = $javaHome."\\jre\\lib\\rt\.jar";
system("xcopy_rt_jar.bat \"$rtJarPath\" ");

my $filenameIn="..\\project_config.txt";

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
		system("newsToCompile $line");
	}
}
close (FILEIN);
unlink($PackageFile);
unlink("rt.jar");