#!/bin/bash

help() {
    echo "Usage:"
    echo "-p: process, lib, iptables, os, backup"
    echo "-c: command."
    echo "-f: file."
    echo "--db: database name."
    echo "--user: user name."
    echo "-d: Enable debug"
}

while true; do
    if [ "x$1" == "x" ];then
        break;
    fi
    case "$1" in
      -p | --process   ) process=$2; shift 2 ;;
      -c | --command   ) command=$2; shift 2 ;;
      -f | --file   ) file=$2; shift 2 ;;
      -d | --debug ) DEBUG=true; shift 1 ;;
      --db ) db=$2; shift 2 ;;
      --user ) user=$2; shift 2 ;;
      --to ) to=$2; shift 2 ;;
      --from ) from=$2; shift 2 ;;
      --subject ) subject=$2; shift 2 ;;
      --content ) content=$2; shift 2 ;;

      -h | --help  ) 
          help
          shift 1 
          exit 0
          ;;
      --) echo "-- is not a correct option.";shift 1; ;;
      * ) echo "$1 is not a correct option.";shift 1; ;;
    esac
done

if [ "x" == "x$process" ]; then
    help
fi


# --------
# common lib
# --------

lib_help() {
    echo "lib usage:"
    echo "-p lib -c get_date: To return today's date, variable = date"
    echo "-p lib -c get_timestamp: To return timestamp"
    echo "-p lib -c zip_file -f file.txt: to gzip file and change the file name"
    echo "-p lib -c get_key: To test the keycode from keyboard"

}

lib_check_empty() {
    name=$1
    str=$2
    if [ "x" == "x$str" ]; then
        echo "$name can not be empty."
        exit 1
    fi
}

lib_get_date() {
    date=`date +%Y-%m-%d`
    echo $date
}

lib_get_timestamp() {
    date=`date +%s`
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

lib_get_key() {
    perl /usr/local/bin/puritys/keys.pl
}

# --------
# OS Basic command
# --------
os_help() {
    echo "os usage:"
    echo "-p os -c rotate_log: To rotate log, E.g. /var/log/cron, /var/log/messages"
    echo "-p os -c clean_log: To clean log file"
    echo "-p os -c sendmail --to xxx@gmail.com --subject xxx --from xxx@gmail.com --content xxx: To send a email by sendmail command"

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
        sudo service mysql restart
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
    rm -rf /var/log/mariadb/mariadb.log*.gz
    sudo yum clean all
}

os_sendmail() {
    lib_check_empty to $to
    lib_check_empty subject $subject
    lib_check_empty from $from
    lib_check_empty content $content
    cat <<EOF > mail.txt
To: $to
Subject: $subject
Content-Type: text/html;
From: $from

$content   
EOF
    sendmail -t < mail.txt
}
# --------
# Backup command
# --------
backup_help() {
    echo "os usage:"
    echo "-p backup -c dir -f dirpath: To backup a dir"
    echo "-p backup -c mysql --db dbname --user user : To backup mysql"

}

backup_dir() {
    lib_get_date
    if [ "x" != "x$1" ]; then
        file=$1
    fi
    lib_check_empty file $file
    if [ ! -d $file ]; then
        echo "Dir $file not found."
    fi
    name=$(basename "$file")
    sudo tar -zcf ./$name-$date.tar.gz  $file
}

backup_mysql() {
    lib_get_date
    lib_check_empty db $db
    lib_check_empty user $user
    mysqldump $db -h localhost -u $user -p  --default-character-set=utf8 > $db.sql
    lib_gzip_file $db.sql

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


