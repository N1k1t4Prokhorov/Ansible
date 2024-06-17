# Используем официальный образ Python в качестве базового
FROM python:3.10-slim

# Устанавливаем рабочую директорию внутри контейнера
WORKDIR /usr/src/app

# Устанавливаем системные зависимости
RUN apt-get update && apt-get install -y \
    gcc \
    build-essential \
    libffi-dev \
    libssl-dev \
    zlib1g-dev

# Обновляем pip и устанавливаем setuptools, wheel
RUN pip install --upgrade pip setuptools wheel

# Копируем файлы зависимостей в контейнер
COPY requirements.txt .

# Устанавливаем зависимости
RUN pip install --no-cache-dir -r requirements.txt

# Копируем оставшиеся файлы проекта в контейнер
COPY . .

# Открываем порт, который будет использовать ваше приложение
EXPOSE 7000

# Определяем команду для запуска приложения
CMD ["python", "hop.py"]
