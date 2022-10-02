rvm use 3.0.1

rails new simple-blog --api
cd ./simple-blog
bin/rails g scaffold post title body
bin/rails db:create
bin/rails db:migrate
bin/rails db:seed
curl http://127.0.0.1:3000/posts
# JSON ответ с постами

# Ручками создаём удаленный репозиторий на Github
# Либо можно сделать это с помощью утилиты Github cli https://cli.github.com/
# gh repo create
# https://github.com/mzsrn/mzsrn-simple-blog
git remote add origin https://github.com/username/simple-blog.git
git add *
git commit -m "initial commit"
git push --set-upstream origin master # основная ветка может называться main

ssh root@<server_ip>

# Дальнейшие команды выполняются на удалённом сервере

git clone https://github.com/username/simple-blog.git
bundle
bin/rails db:create
bin/rails db:migrate
bin/rails db:seed
# Ctrl+c прерывает текущий процесс
rails s -p 80 -b 0.0.0.0 # В браузере заходим по адресу http://<server_ip>/posts

# Выход с удалённой машины
logout # exit

# Дальнейшие команды выполняются на локальной машине

# После добавления Capistrano в зависимости и установки

cap -T
cap install
scp config/master.key root@<server_ip>://var/www/simple-blog/shared/config
cap staging deploy
cap staging deploy:seed
cap staging deploy:run

# Отобразить процесс, который занял порт 3000
lsof -wni tcp:3000

# https://guides.hexlet.io/ru/docker/
# https://hub.docker.com/
docker -v
docker build -t <username>/simple-blog .
docker login -u <username>
docker push <username>/simple-blog


ssh root@<server_ip>
docker pull <username>/simple-blog
docker images
docker run --rm -p 3001:3001 <username>/simple-blog
docker stop <hash>
docker rm <hash>


# Heroku
# https://devcenter.heroku.com/articles/heroku-cli
heroku login
heroku apps:create
git remote -v
# heroku  https://git.heroku.com/<app_name>.git (fetch)
# heroku  https://git.heroku.com/<app_name>.git (push)
# origin  git@github.com:<username/<repo_name>.git (fetch)
# origin  git@github.com:<username/<repo_name>.git (push)
# Добавление приложения в готовый репо (если приложение создано через web интерфейс)
либо heroku git:remote -a <app_name>
# Добавление сервиса базы данных Postgres к приложению на хероку
heroku addons:create heroku-postgresql:hobby-dev
# деплой выполняется по коммиту
git push heroku
# heroku run запускает команды в приложении Heroku
# heroku run bash
heroku run bin/rails db:migrate
heroku run bin/rails db:seed

# https://github.com/Hexlet/hexlet-cv - пример приложения, задеплоенного на Heroku
# Open: https://<app_name>.herokuapp.com/posts
