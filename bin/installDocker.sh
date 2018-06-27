# RHEL
# sudo yum -y install docker docker-registry


# centos
sudo yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2

sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

sudo yum-config-manager --enable docker-ce-edge
sudo yum install docker-ce

sudo service docker start
sudo chown `whoami`  /var/run/docker.sock

# install docker compose
sudo curl --tlsv1.2 -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

