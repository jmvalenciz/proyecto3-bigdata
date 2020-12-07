# crear una instancia de EC2 con mínimo 8GB de RAM y 40 GB de almacenamiento persistente
# los comandos que se van a utilizar son para Amazon Linux 2 x86_64

# Configurar Docker, docker-compose y git

# docker
sudo amazon-linux-extras install docker -y
sudo service docker start
sudo usermod -a -G docker ec2-user
sudo chkconfig docker on

# docker-compose
sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/bin/docker-compose
sudo chmod +x /usr/bin/docker-compose
sudo reboot

# esperar a que la máquina inicie de nuevo y entrar por ssh

# git
sudo yum install -y git

# Configurar Apache Superset con docker-compose
git clone https://github.com/apache/incubator-superset.git --depth 1
cd incubator-superset
touch ./docker/requirements-local.txt
echo "pyhive" >> ./docker/requirements-local.txt
docker-compose build --force-rm
docker-compose up
