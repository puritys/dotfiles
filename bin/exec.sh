while true; do
    if [ "x$1" == "x" ];then
        break;
    fi
    case "$1" in
      -p | --process   ) process=$2; shift 2 ;;
      -c | --command   ) command=$2; shift 2 ;;
      -f | --file   ) file=$2; shift 2 ;;
      -d | --debug ) DEBUG=true; shift 1 ;;
      -h | --help  ) 
          echo "Usage:"
          echo "-p: process, lib, iptables, os"
          echo "-c: command."
          echo "-f: file."
          echo "-d: Enable debug"
          shift 1 
          exit 0
          ;;
      --) echo "-- is not a correct option.";shift 1; ;;
      * ) echo "$1 is not a correct option.";shift 1; ;;
    esac
done
# --------
# common lib
# --------

lib_help() {
    echo "lib usage:"
    echo "-p lib -c get_date: To return today's date, variable = date"
    echo "-p lib -c zip_file -f file.txt: to gzip file and change the file name"

}

lib_get_date() {
    date=`date +%Y-%m-%d`
    echo $date
}

lib_gzip_file() {
    lib_get_date
    action=""
    if [ "x" != "x$1" ]; then
        file=$1
    fi
    if [ "x" != "x$2" ]; then
        action=$2
    fi
    if [ "x" == "x$file" ];then
        echo "file is empty"
        return;
    fi
    if [ ! -f $file ]; then
        echo "File $file not found."
    fi
    echo "zip file: $file to $file-$date.gz"
    gzip $file
    mv $file.gz $file-$date.gz
    if [ "xsetEmpty" == "x$action" ]; then
        touch $file
    fi
}

# --------
# OS Basic command
# --------
os_help() {
    echo "os usage:"
    echo "-p os -c rotate_log: To rotate log, E.g. /var/log/cron, /var/log/messages"
    echo "-p lib -c clean_log: To clean log file"

}

os_rotate_log() {
    sudo systemctl stop rsyslog
    lib_gzip_file /var/log/cron setEmpty
    lib_gzip_file /var/log/messages setEmpty
    lib_gzip_file /var/log/secure setEmpty
    lib_gzip_file /var/log/maillog setEmpty
    lib_gzip_file /var/log/wtmp setEmpty
    lib_gzip_file /var/log/yum.log setEmpty
    lib_gzip_file /var/log/dmesg setEmpty
    lib_gzip_file /var/log/mariadb/mariadb.log setEmpty
    if [ -f /var/log/mariadb/mariadb.log ]; then
        sudo chown mysql:root /var/log/mariadb/mariadb.log
    fi
    sudo systemctl start rsyslog
}

os_clean_log() {
    rm -f /var/log/cron*.gz
    rm -f /var/log/messages*.gz
    rm -f /var/log/secure*.gz
    rm -f /var/log/maillog*.gz
    rm -f /var/log/wtmp*.gz
    rm -f /var/log/yum.log-*
    rm -f /var/log/dmesg.old
    rm -f /var/log/dmesg*.gz
    sudo yum clean all
}

# --------
# iptables
# --------
iptables_help() {
    echo "iptables usage:"
    echo "-p iptables -c restore: To restore setting"
    echo "-p iptables -c save: To save setting"
}

iptables_restore() {

    if [ ! -f iptableBackup.rule ]; then
        echo "File iptableBackup.rule not found."
    else
        sudo iptables-restore < iptableBackup.rule
    fi
}

iptables_save() {
    sudo iptables-save > iptableBackup.rule
}


if [ "x" != "x$process" ] && [ "x" == "x$command" ]; then
    $process"_help"
fi

if [ "x" != "x$process" ] && [ "x" != "x$command" ]; then
    $process"_"$command
fi 


