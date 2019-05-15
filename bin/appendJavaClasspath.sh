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
        command="sed 's/<\/classpath>/$preSpace<classpathentry kind=\"src\" path=\"$appendPathSlash\" including=\"**\/*.java\" \/>\n<\/classpath>/'  -i $file"
        echo $command
        eval $command
    fi
}


if [ ! -f $file ]; then
cat <<EOF >> $file
<?xml version="1.0" encoding="UTF-8"?>
<classpath>
    <classpathentry kind="src" path="src"/>
    <classpathentry kind="con" path="org.eclipse.jdt.launching.JRE_CONTAINER"/>
    <classpathentry kind="output" path="bin"/>
</classpath>
EOF
fi

appendPathList=(${appendPaths//,/ }); 
for(( i=0; i<${#appendPathList[@]}; i++ ))
do
    appendPath=${appendPathList[$i]}
    appendClasspath
done
