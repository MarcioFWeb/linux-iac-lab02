#!/bin/bash

echo "-- Primeiro o snapshot foi restaurado"

echo "-- Atualizando o servidor"
apt-get update
apt-get upgrade -y

echo "-- Baixando e instalando Apache2 e Unizip"
apt-get install apache2 unzip -y

echo "-- Baixando e descompactando código fonte do site que será publicado"
cd /tmp
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip
unzip main.zip

echo "-- Copiando código do site para a pasta padrão do Apache"
cd linux-site-dio-main
cp -R * /var/www/html/

echo "-- Reiniciando o Apache"
systemctl stop apache2
systemctl start apache2

