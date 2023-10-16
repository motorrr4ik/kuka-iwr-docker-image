## О репозитории
Данный репозиторий содержит в себе инструкции по сборке и запуску Docker-контейнера для взаимодействия с KUKA KMR/LMR iiwa с помощью ROS2. Ноды и топики, а также Java-программа для взаимодействия с самим роботом были взяты с данного [репозитория](https://github.com/ninamwa/kmriiwa_ws/tree/eloquent)
## Подготовка окружения
**Примечание:** Тестирование и использование производилось на ОС Ubuntu 22.04.3 LTS.  
Шаги для подготовки:
1. Установка [Docker Engine](https://docs.docker.com/engine/install/ubuntu/)
2. Клонирование текущего репозитория `git clone git@github.com:motorrr4ik/kuka-iwr-docker-image.git`
3. Для взаимодействия и программирования робота KUKA воспользуйтесь утилитой **Sunrise Cabinet**
## Запуск
Шаги для запуска:
1. Подключиться к сети, в которой находится робот KUKA
2. Выполнить скрипт для получения IP-адреса: `./get_ip.sh`
3. Собрать Docker-образ: `docker compose -f docker-compose.yaml build`
4. Запустить требуемый сервис для взаимодействия с роботом: `docker compose run -it *service-name*`