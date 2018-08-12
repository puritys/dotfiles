sudo yum clean all
sudo find  /var/spool/postfix/maildrop/ -name "*" | xargs -t -n 1 sudo rm
