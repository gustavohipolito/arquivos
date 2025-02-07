#!/bin/bash

# Verifica se está rodando como root
if [ "$(id -u)" != "0" ]; then
    echo "Este script precisa ser executado como root"
    exit 1
fi

# Verifica se o CSF está instalado
if [ ! -f "/etc/csf/csf.conf" ]; then
    echo "CSF não encontrado. Por favor, instale o CSF primeiro."
    exit 1
fi

# Função para alterar configurações no csf.conf
update_csf_config() {
    local param=$1
    local value=$2
    sed -i "s/^$param = .*/$param = $value/" /etc/csf/csf.conf
}

# Função para reiniciar serviço e verificar status
restart_service() {
    local service_name=$1
    echo "Reiniciando serviço $service_name..."
    
    service $service_name restart
    local restart_status=$?
    
    if [ $restart_status -ne 0 ]; then
        echo "ERRO: Falha ao reiniciar $service_name"
        exit 1
    fi
    
    # Aguarda até 30 segundos pelo serviço iniciar
    for i in {1..30}; do
        if service $service_name status >/dev/null 2>&1; then
            echo "$service_name reiniciado com sucesso"
            return 0
        fi
        sleep 1
    done
    
    echo "ERRO: Timeout ao aguardar $service_name iniciar"
    exit 1
}

echo "Configurando CSF..."

# Atualiza as configurações no csf.conf
update_csf_config "MESSENGER" "\"1\""
update_csf_config "MESSENGER_TEMP" "\"1\""
update_csf_config "MESSENGER_PERM" "\"1\""
update_csf_config "MESSENGER_USER" "\"csf\""
update_csf_config "MESSENGERV2" "\"1\""
update_csf_config "MESSENGER_HTTPS_IN" "\"443,2083,2087,2096\""
update_csf_config "RECAPTCHA_SITEKEY" "\"6LfFnuYhAAAAAPMKljCELND-9DP4CCfjAI-7s-o-\""
update_csf_config "RECAPTCHA_SECRET" "\"6LfFnuYhAAAAAMNmLsiDbUClTejKGR0T30fH0kGS\""

# Cria usuário csf se não existir
if ! id "csf" &>/dev/null; then
    useradd csf -s /bin/false
    echo "Usuário csf criado"
fi

# Reinicia os serviços e verifica status
echo "Reiniciando serviços..."
service csf restart
if [ $? -ne 0 ]; then
    echo "ERRO: Falha ao reiniciar CSF"
    exit 1
fi

service lfd restart
if [ $? -ne 0 ]; then
    echo "ERRO: Falha ao reiniciar LFD"
    exit 1
fi

# Aguarda alguns segundos para o CSF criar os diretórios
echo "Aguardando a criação dos diretórios pelo CSF..."
sleep 5

# Download dos arquivos do GitHub
echo "Baixando arquivos personalizados..."

# Função para download de arquivo do GitHub (raw content)
download_github_file() {
    local repo_path=$1
    local output_file=$2
    local raw_url="https://raw.githubusercontent.com/gustavohipolito/arquivos/main/$(basename $repo_path)"
    
    if curl -sSL "$raw_url" -o "$output_file"; then
        echo "Download concluído: $output_file"
        chown csf:csf "$output_file"
        chmod 644 "$output_file"
    else
        echo "ERRO: Falha ao baixar $output_file"
        return 1
    fi
}

# Download dos arquivos
download_github_file "en.php" "/home/csf/en.php"
download_github_file "index.php" "/home/csf/public_html/index.php"
download_github_file "recaptcha.php" "/home/csf/recaptcha.php"

echo "Configuração concluída!"
echo "Por favor, verifique se todos os arquivos foram baixados corretamente:"
echo "- /home/csf/en.php"
echo "- /home/csf/public_html/index.php"
echo "- /home/csf/recaptcha.php"
