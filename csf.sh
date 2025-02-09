#!/bin/bash

echo "Fazendo backup do csf.conf..."
cp /etc/csf/csf.conf{,.backup}

echo "Configurando parâmetros do CSF..."
sed -i 's/^MESSENGER = .*/MESSENGER = "1"/' /etc/csf/csf.conf
sed -i 's/^MESSENGER_TEMP = .*/MESSENGER_TEMP = "1"/' /etc/csf/csf.conf
sed -i 's/^MESSENGER_PERM = .*/MESSENGER_PERM = "1"/' /etc/csf/csf.conf
sed -i 's/^MESSENGER_USER = .*/MESSENGER_USER = "csf"/' /etc/csf/csf.conf
sed -i 's/^MESSENGERV3 = .*/MESSENGERV3 = "1"/' /etc/csf/csf.conf
sed -i 's/^MESSENGER_HTTPS_IN = .*/MESSENGER_HTTPS_IN = "443,2083,2087,2096"/' /etc/csf/csf.conf
sed -i 's/^RECAPTCHA_SITEKEY = .*/RECAPTCHA_SITEKEY = "6LfFnuYhAAAAAPMKljCELND-9DP4CCfjAI-7s-o-"/' /etc/csf/csf.conf
sed -i 's/^RECAPTCHA_SECRET = .*/RECAPTCHA_SECRET = "6LfFnuYhAAAAAMNmLsiDbUClTejKGR0T30fH0kGS"/' /etc/csf/csf.conf

echo "Criando usuário csf..."
useradd csf -s /bin/false 2>/dev/null || true

echo "Atualizando arquivo en.php..."
curl -s https://raw.githubusercontent.com/gustavohipolito/arquivos/main/en.php > /etc/csf/messenger/en.php

echo "Reiniciando serviços CSF e LFD..."
service csf restart
echo "Aguardando 5 segundos após restart do CSF..."
sleep 5

service lfd restart
echo "Aguardando 5 segundos após restart do LFD..."
sleep 5

echo "Configuração concluída!"
