#!/bin/bash

# Cores para destacar a saída
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Função para exibir mensagens de sucesso
success() {
  echo -e "${GREEN}$1${NC}"
}

# Função para exibir mensagens informativas
info() {
  echo -e "${YELLOW}$1${NC}"
}

# Cabeçalho bonito
echo "-----------------------------------------------------------------------------"
echo -e "${GREEN}Iniciando banco${NC}"

cd mysql

# Iniciar containers Docker
docker-compose -p onfly up  -d

cd ../

# Informar o endereço e a porta do servidor Laravel
info "Iniciando aplicação"

# Iniciar servidor Laravel
php artisan serve

# Mensagem de encerramento
success "Aplicação Laravel e Docker inicializados com sucesso!"
