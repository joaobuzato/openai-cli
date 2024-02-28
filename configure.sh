#!/bin/bash

# Caminho para o script JavaScript
SCRIPT_PATH="$(realpath src/index.js)"

# Caminho onde o link simbólico será criado
BIN_PATH="/usr/local/bin/openai-cli"

# Criar o conteúdo do script openai-cli
echo '#!/bin/bash' | sudo tee openai-cli-temp > /dev/null
echo "node \"$SCRIPT_PATH\" \"\$@\"" | sudo tee -a openai-cli-temp > /dev/null

# Move o arquivo temporário para o local correto
sudo mv openai-cli-temp "$BIN_PATH"

# Dá permissão de execução ao script
sudo chmod +x "$BIN_PATH"

echo "openai-cli configurado com sucesso!"
