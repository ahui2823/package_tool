该工程用于编译多渠道Android应用，替换相应的标签，然后重新打包


在所有的配置文件里含有#号的行将视为是注释


只有如下三个文件是使用时需要填的
1. 在env_config.txt里按格式填好环境配置信息（这个只需要在第一次使用的时候填写就好了）
2. 在project_config.txt里按格式填好要编译的项目信息
3. 在qudao_config.txt里面按格式填好渠道的标签（如果渠道固定，也只需要填写一次即可）


填好所有配置信息后，双击clickMeToStartCompile.bat文件开始执行

每次成功输出后，目标目录下除了生成apk文件，还会多出一个%projectName%_proguard.map文件，该文件内容为被混淆前和混淆后对应的名称表（用于错误反馈时方便定位错误位置）





请确定你的机器上装有perl环境，如果没有，可到http://www.activestate.com/activeperl/downloads 进行下载，然后安装
（安装时一直下一步直到完成，默认会把perl执行文件路径加到系统环境变量PATH中，如果没加到系统环境变量中，请自行将perl环境加到系统环境变量中）。




注意事项 

1. 第三方的jar包应存放在lib目录下，（如果你的存放目录是libs，不想改为lib，请自行到package文件下找到 %AndroidProject%\lib 替换为 %AndroidProject%\libs， 
这里还要注意的一点:全局替换的时候请注意文件中有%AndroidProject%\libs，这个是用来存放so的，默认认为jar文件存放在lib目录下，so文件存放在libs目录下，别搞混了）;

2. 要被替换的tag在AndroidManifest.xml文件中应是唯一存在的，否则正则匹配会出错(或者统一用“{qudao_tag}”作为标签)；

3. 如果程序非正常退出（点了右上角X关闭的），请手动将工程目录下的TempAndroidManifest.xml文件恢复为AndroidManifest.xml。