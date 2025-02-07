#!/bin/bash

echo "Fazendo backup do csf.conf..."
cp /etc/csf/csf.conf{,.backup}

echo "Configurando parâmetros do CSF..."
sed -i 's/^MESSENGER = .*/MESSENGER = "1"/' /etc/csf/csf.conf
sed -i 's/^MESSENGER_TEMP = .*/MESSENGER_TEMP = "1"/' /etc/csf/csf.conf
sed -i 's/^MESSENGER_PERM = .*/MESSENGER_PERM = "1"/' /etc/csf/csf.conf
sed -i 's/^MESSENGER_USER = .*/MESSENGER_USER = "csf"/' /etc/csf/csf.conf
sed -i 's/^MESSENGERV2 = .*/MESSENGERV2 = "1"/' /etc/csf/csf.conf
sed -i 's/^MESSENGER_HTTPS_IN = .*/MESSENGER_HTTPS_IN = "443,2083,2087,2096"/' /etc/csf/csf.conf
sed -i 's/^RECAPTCHA_SITEKEY = .*/RECAPTCHA_SITEKEY = "6LfFnuYhAAAAAPMKljCELND-9DP4CCfjAI-7s-o-"/' /etc/csf/csf.conf
sed -i 's/^RECAPTCHA_SECRET = .*/RECAPTCHA_SECRET = "6LfFnuYhAAAAAMNmLsiDbUClTejKGR0T30fH0kGS"/' /etc/csf/csf.conf

echo "Criando usuário csf..."
useradd csf -s /bin/false 2>/dev/null || true

echo "Reiniciando serviços CSF e LFD..."
service csf restart
echo "Aguardando 5 segundos após restart do CSF..."
sleep 5

service lfd restart
echo "Aguardando 5 segundos após restart do LFD..."
sleep 5

echo "Aguardando e verificando criação dos diretórios..."
max_attempts=30
attempt=1
while [ ! -d "/home/csf/public_html" ] && [ $attempt -le $max_attempts ]; do
    echo "Tentativa $attempt de $max_attempts - Aguardando diretórios serem criados..."
    sleep 2
    attempt=$((attempt + 1))
done

if [ ! -d "/home/csf/public_html" ]; then
    echo "ERRO: Diretório /home/csf/public_html não foi criado após $(($max_attempts * 2)) segundos"
    exit 1
fi

echo "Diretórios criados com sucesso! Aplicando arquivos personalizados..."
curl -s https://raw.githubusercontent.com/gustavohipolito/arquivos/main/en.php > /home/csf/en.php
curl -s https://raw.githubusercontent.com/gustavohipolito/arquivos/main/index.php > /home/csf/public_html/index.php
curl -s https://raw.githubusercontent.com/gustavohipolito/arquivos/main/recaptcha.php > /home/csf/recaptcha.php

echo "Configuração concluída!"
