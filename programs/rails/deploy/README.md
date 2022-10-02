# Deploy

## Ссылки

* [Heroku](https://heroku.com/) — PaaS сервис для хостинга приложений
* [Гайд - Что такое деплой?](https://guides.hexlet.io/deploy/)
* [Hexlet CV](https://github.com/Hexlet/hexlet-cv)
* [Документация Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli)
* [Getting Started on Heroku with Rails 6.x - deploy to Heroku](https://devcenter.heroku.com/articles/getting-started-with-rails6#deploy-your-application-to-heroku)

## Задачи

Копировать приложение в директорию домашней работы не нужно.

* Зарегистрируйтесь на [Heroku](https://heroku.com/). Если вы из РФ, вам необходимо [подключить VPN](https://github.com/Hexlet/hexlet-unblock) и указать другую страну
* Установите Heroku CLI
* Склонируйте к себе проект hexlet-cv и запустите локально следуя инструкциям в README
* Создайте приложение Heroku. После создания приложения появится удаленный репозиторий `heroku`

  ```bash
  heroku create <app_name>
  git remote -v
  ```

* Задайте окружение для приложения

  ```bash
  heroku config:set RAILS_ENV=production
  heroku config:set HOST=<app_name>.herokuapp.com
  heroku config:set EMAIL_FROM=<your_email>

  ```

* Создайте базу данных (Postgres). Вместе с созданной базой данных будет создана переменная окружения `DATABASE_URL`, которая содержит данные для подключения к базе данных

  ```bash
  heroku addons:create heroku-postgresql:hobby-dev
  heroku config # Вывод переменных окружений
  ```

* Деплой приложения на Heroku выполняется пушем в удаленный репозиторий. Выполните деплой командой

  ```bash
  # git push heroku
  make deploy

  # See http://<app_name>.herokuapp.com
  ```

* Добавьте ссылку на задеплоенное приложение в файл *solution*

## Дополнительное задание

Подключите к приложению Rollbar и убедитесь, что сообщения об ошибках отправляются в сервис.
