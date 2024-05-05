#!/bin/bash
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install -y docker-ce

while ! sudo docker info >/dev/null 2>&1; do
    echo "En attente que Docker démarre..."
    sleep 1
done


sudo systemctl start docker
sudo systemctl enable docker 
sudo apt update
sudo apt install -y nginx
cd /var/www/html/
git clone https://github.com/nfassorydiaby/nodeJs-challenge.git
cd /var/www/html/nodeJs-challenge
cat <<EOF >.env
CLASS=project
DATABASE_URL=postgres://root:password@db:5432/app
DATABASE_URL_ECOM=postgres://root:password@db-ecom:5432/app
EOF
touch /var/run/user_data_done
