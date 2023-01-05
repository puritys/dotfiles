
while true; do
    if [ "x$1" == "x" ];then
        break;
    fi
    case "$1" in
      -v | --version   ) version=$2; shift 2 ;;
      -d | --debug ) DEBUG=true; shift 1 ;;
      -h | --help  )
          echo "Usage:"
          echo "-t: set tag name, ex: -t mytag."
          echo "-d: Enable debug"
          shift 1
          exit 0
          ;;
      --) echo "-- is not a correct option.";shift 1; ;;
      * ) echo "$1 is not a correct option.";shift 1; ;;
    esac
done

if [ `uname` == "Darwin" ];then
    if [ $version == 11 ];then
        brew install openjdk@11
        if [ -f /opt/homebrew/opt/openjdk@11/bin/java ];then
            sudo ln -sf /opt/homebrew/opt/openjdk@11/bin/java /usr/local/bin/java
        else
            sudo ln -sf /usr/local/opt/openjdk@11/bin/java /usr/local/bin/java
        fi
    fi
else
    sudo dnf install java-11-openjdk-devel
fi
