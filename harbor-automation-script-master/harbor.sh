cd /

sudo yum install wget -y

cd /home/authentick9/

sudo wget https://storage.googleapis.com/harbor-releases/release-1.8.0/harbor-online-installer-v1.8.2.tgz
sudo tar xvf harbor-online-installer-v1.8.2.tgz

sudo curl -fsSL https://get.docker.com -o get-docker.sh

sudo chmod 777 get-docker.sh

#sudo ./get-docker.sh

sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

#sudo usermod -aG docker root

#sudo systemctl start docker

#sudo systemctl enable docker

#cd harbor

#sudo sed -i 's/reg.mydomain.com/35.208.79.42/' harbor.yml

#sudo ./install.sh --with-clair

#sudo docker-compose down

#sudo systemctl restart docker

#sudo ./install.sh --with-clair

cat > /etc/docker/daemon.json << EOF
{
        "insecure-registries" : ["35.208.79.42"]
}
EOF
