#Atualiza a lista de repositorios
sudo apt-get update

#Instala pacotes extras para o APT utilizat repositorios HTTPS
sudo apt-get install -y apt-transport-https ca-certificates curl
gnupg-agent software-properties-common

#Baixa e adiciona a chave publica do docker no sistema
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88

#Adiciona o repositorio que contem os pacotes para a instalacao do docker
sudo add-apt-repository -y \
"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) \
stable"

# Atualiza a lista de repositorios
sudo apt-get update

#Instala os pacotes docker
sudo apt-get install -y docker-ce docker-ce-cli containerd.io