sudo apt-get update
sudo apt install ca-certificates apt-transport-https -y
sudo apt-get install apache2 -y
sudo apt-get install mysql-server -y
sudo apt-get install wget -y
wget -q https://packages.sury.org/php/apt.gpg -O- | sudo apt-key add -
sudo echo "deb https://packages.sury.org/php/ stretch main" | tee /etc/apt/sources.list.d/php.list
sudo apt update
sudo apt install php php-mysql libapache2-mod-php -y
