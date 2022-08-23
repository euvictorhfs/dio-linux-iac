#!/bin/bash

echo "Atualizando o servidor..."
apt-get update
apt-get upgrade -y
apt-get install apache2 -y
apt-get install unzip -y

echo "Atualizando pacote wget (caso não exista)..."
apt-get install wget -y

echo "Baixando e descompactando os arquivos da aplicação web..."
cd /tmp
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.>
unzip main.zip

echo "Copiando os arquivos baixados para a aplicação Apache..."
cd linux-site-dio-main
cp -R * /var/www/html
