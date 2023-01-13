
os=`cat /etc/*-release | grep -o "^ID=\"[a-z]*\""`
version=`cat /etc/*-release | grep -o "^VERSION=\"[0-9]*" |grep -o "[0-9]*"`
echo "os is $os"
echo "version is $version"

if [[ $os == *"centos"* ]] || [[ $os == *"rhel"* ]]; then
    if [ $version -gt 6 ]; then
        echo "Start install docker engine"
        sudo yum -y install yum-utils
        sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
        hasExclude=`grep exclude /etc/yum.conf | wc -l`
        if [ $hasExclude -eq 0 ]; then
            sudo bash -c 'echo "exclude=.i386 .i686" >> /etc/yum.conf'
        fi
        sudo yum install -y docker-ce
        sudo service docker start
        sudo chown `whoami` /var/run/docker.sock

        sudo bash -c "curl --tlsv1.2 -L https://github.com/docker/compose/releases/download/v2.15.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose"
        sudo chmod +x /usr/local/bin/docker-compose
    else
        sudo tee /etc/yum.repos.d/docker.repo <<-EOF
[dockerrepo]
name=Docker Repository
baseurl=https://yum.dockerproject.org/repo/main/centos/6
enabled=1
gpgcheck=1
gpgkey=https://yum.dockerproject.org/gpg
EOF
        sudo yum install docker-engine
    fi
fi
