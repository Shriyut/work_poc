sudo yum install wget -y
sudo yum install unzip -y

cd ~
cd SonarQube-automation
sudo yum install http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm -y

sudo yum install mysql-server -y

sudo systemctl start mysqld

sudo yum install java-1.8.0-openjdk-devel.x86_64

echo 'export IP=`curl -H "Metadata-Flavor: Google" http://metadata/computeMetadata/v1/instance/description`' >> ~/.bash_profile
source ~/.bash_profile

echo 'export IIP=$(hostname -i)' >> ~/.bash_profile
source ~/.bash_profile

cat > ~/SonarQube-automation/commands.sql << EOF

CREATE USER 'sonarqube'@'$IP' IDENTIFIED BY 'password';
CREATE DATABASE sonarqube;
GRANT ALL PRIVILEGES ON sonarqube.* TO 'sonarqube'@'$IP';

EOF

mysql -h $IP -u root -ppassword < commands.sql

sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-6.0.zip
sudo unzip sonarqube-6.0.zip

cd sonarqube-6.0

cd conf 

sudo echo 'sonar.jdbc.username=sonarqube' >> sonar.properties
sudo echo 'sonar.jdbc.password=password' >> sonar.properties
sudo echo 'sonar.jdbc.url=jdbc:mysql://'$IP':3306/sonarqube?useUnicode=true&characterEncoding=utf8&rewriteBatchedStatements=true&useConfigs=maxPerformance' >> sonar.properties
sudo echo 'sonar.web.host='$IIP'' >> sonar.properties
sudo echo 'sonar.web.port=9000' >> sonar.properties

cd ..
cd bin
cd linux-x86-64
sudo ./sonar.sh start

cd ..
cd ..
cd ..


sudo wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-3.3.0.1492-linux.zip
sudo unzip sonar-scanner-cli-3.3.0.1492-linux.zip


cd sonar-scanner-3.3.0.1492-linux
cd conf

sudo echo 'sonar.host.url=http://'$IIP':9000' >> sonar-scanner.properties
