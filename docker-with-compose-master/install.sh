cd /
cd /home/authentick9/

sudo curl -fsSL https://get.docker.com -o get-docker.sh

sudo chmod 777 get-docker.sh

sudo ./get-docker.sh

sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

sudo usermod -aG docker root

sudo systemctl start docker

sudo systemctl enable docker
