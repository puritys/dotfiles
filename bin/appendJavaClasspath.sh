#!/bin/sh

file=.classpath
appendPaths="target/generated-sources/java,target/generated-sources/annotations"


appendClasspath () {
    echo "Grep $appendPath"
    appendPathSlash=`echo $appendPath | sed 's/\//\\\\\//g'`
    hasPath=`grep $appendPath $file |wc -l` 
    preSpace="        "
    if [ $hasPath -eq 0 ];then
        echo "To append $appendPath"
        command="sed 's/<\/classpath>/$preSpace<classpathentry kind=\"src\" path=\"$appendPathSlash\" \/>\n<\/classpath>/'  -i $file"
        echo $command
        eval $command
    fi  
}






appendPathList=(${appendPaths//,/ }); 
for(( i=0; i<${#appendPathList[@]}; i++ ))
do
    appendPath=${appendPathList[$i]}
    appendClasspath
done
