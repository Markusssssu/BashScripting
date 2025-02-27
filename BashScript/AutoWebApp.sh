#!/bin/bash

# Конфигурация
REPO_URL="https://github.com/example/webapp.git"
APP_DIR="/var/www/webapp"
ENV_FILE="$APP_DIR/.env"
SERVER_RESTART_CMD="sudo systemctl restart apache2"

# Проверка наличия Git
if ! command -v git &> /dev/null; then
    echo "Git is not installed. Installing Git..."
    sudo apt install git -y
fi

# Клонирование репозитория
if [ ! -d "$APP_DIR" ]; then
    echo "Cloning repository..."
    git clone "$REPO_URL" "$APP_DIR"
else
    echo "Updating repository..."
    cd "$APP_DIR" || exit
    git pull origin main
fi

# Установка зависимостей
if [ -f "$APP_DIR/requirements.txt" ]; then
    echo "Installing Python dependencies..."
    pip install -r "$APP_DIR/requirements.txt"
fi

# Настройка окружения
if [ ! -f "$ENV_FILE" ]; then
    echo "Creating .env file..."
    cat <<EOL > "$ENV_FILE"
DATABASE_URL=postgres://user:password@localhost/dbname
SECRET_KEY=your_secret_key
DEBUG=False
EOL
fi

# Перезапуск сервера
echo "Restarting server..."
eval "$SERVER_RESTART_CMD"

echo "Deployment completed!"