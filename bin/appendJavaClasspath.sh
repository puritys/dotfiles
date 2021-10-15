#!/bin/sh

file=.classpath
while true; do
    if [ "x$1" == "x" ];then
        break;
    fi
    case "$1" in
      -f | --file   ) file=$2; shift 2 ;;
      -h | --help  )
          echo "Usage:"
          echo "-f: file -f .classpaht."
          shift 1
          exit 0
          ;;
      --) echo "-- is not a correct option.";shift 1; ;;
      * ) echo "$1 is not a correct option.";shift 1; ;;
    esac
done
#appendPaths="target/generated-sources/java,target/generated-sources/annotations"
appendPaths="src/generated-sources/java"
appendPaths="target/generated-sources/java"


appendClasspath () {
    echo "Grep $appendPath"
    appendPathSlash=`echo $appendPath | sed 's/\//\\\\\//g'`
    hasPath=`grep $appendPath $file |wc -l`
    preSpace="        "
    if [ $hasPath -eq 0 ];then
        echo "To append $appendPath"
        if [ `uname` == "Darwin" ];then
            command="sed -i '' 's/<\/classpath>/$preSpace<classpathentry kind=\"src\" path=\"$appendPathSlash\" including=\"**\/*.java\" \/>\n<\/classpath>/'  $file"
        else
            command="sed 's/<\/classpath>/$preSpace<classpathentry kind=\"src\" path=\"$appendPathSlash\" including=\"**\/*.java\" \/>\n<\/classpath>/'  -i $file"
        fi
        echo $command
        eval $command
    fi
}


if [ ! -f $file ]; then
cat <<EOF >> $file
<?xml version="1.0" encoding="UTF-8"?>
<classpath>
    <classpathentry kind="src" path="src/main/java"/>
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
