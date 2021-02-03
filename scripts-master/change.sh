export another=$(echo $tools)
export t1=$(echo $tools | sed "s/,/-/g")
export time=$(date +"%m%d%y%H%M%S")

echo $another
echo $t1
echo $time

for i in $(echo $another | sed "s/,/ /g")
do
  array+=( $i )
done

arraylength=${#array[@]}

for(( i=0; i<${arraylength}; i++));

do
  echo ${array[i]}
   
  if [[ ${array[i]} = "jenkins" ]];
  then   
    echo "we got jenkins";
    export j=jenkins
    cd ~
    sudo  git clone https://github.com/iamdaaniyaal/jenkins.git
    sudo chmod 777 jenkins
    cd jenkins
    sudo sed -i 's/tvalues/'$j'/' terraform.tfvars
    sudo sed -i 's/tname/'$tool_name'/' terraform.tfvars
    sudo sed -i 's/ttype/'$tool'/' terraform.tfvars
    sudo sed -i 's/timestamp/'$time'/' terraform.tfvars
    terraform init
    terraform plan
    terraform apply --auto-approve
  elif [[ ${array[i]} =  "sonarqube" ]];
  then
    export s=sonarqube
    cd ~  
    sudo git clone https://github.com/iamdaaniyaal/sonarqube.git
    sudo chmod 777 sonarqube
    cd sonarqube
    sudo sed -i 's/tvalues/'$s' terraform.tfvars
    sudo sed -i 's/tname/'$tool_name'/' terraform.tfvars
    sudo sed -i 's/ttype/'$tool'/' terraform.tfvars
    sudo sed -i 's/timestamp/'$time'/' terraform.tfvars
    terraform init
    terraform plan
    terraform apply --auto-approve
  elif  [[ ${array[i]} = "harbor" ]];
  then
     export h=harbor
    echo "we got harbor";
    cd ~
    sudo  git clone https://github.com/iamdaaniyaal/harbor.git
    sudo chmod 777 harbor
    cd harbor    
    sudo sed -i 's/tvalues/'$h/' terraform.tfvars
    sudo sed -i 's/tname/'$tool_name'/' terraform.tfvars
    sudo sed -i 's/ttype/'$tool'/' terraform.tfvars
    sudo sed -i 's/timestamp/'$time'/' terraform.tfvars
    terraform init
    terraform plan
    terraform apply --auto-approve
  elif  [[ ${array[i]} = "maven" ]];
  then
    export m=maven
    echo "maven is here";
    cd ~
    sudo git clone https://github.com/iamdaaniyaal/maven.git
    sudo chmod 777 maven
    cd maven
    sudo sed -i 's/tvalues/'$m/' terraform.tfvars
    sudo sed -i 's/tname/'$tool_name'/' terraform.tfvars
    sudo sed -i 's/ttype/'$tool'/' terraform.tfvars
    sudo sed -i 's/timestamp/'$time'/' terraform.tfvars
    terraform init
    terraform plan
    terraform apply --auto-approve
  fi   
done
