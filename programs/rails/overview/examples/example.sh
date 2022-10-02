## Полезные ссылки ##
# https://guides.rubyonrails.org/
# http://rusrails.ru/rails-routing
# http://rusrails.ru/generators
# http://rusrails.ru/action-controller-overview
# http://rusrails.ru/active-record-basics
# http://rusrails.ru/rails-database-migrations
# http://rusrails.ru/action-view-overview
# https://github.com/hexlet/hexlet-cv

## Полезные команды ##

# Установить rails
gem install rails
# либо в Gemfile
# gem 'rails'
rails --version
rails --help

# Создать приложение
rails new testapp

# Запустить приложение
bin/rails server

# Роуты
bin/rails routes

# Генераторы
bin/rails generate

# Модели
bin/rails generate model --help
bin/rails generate model user login:string age:integer

# Контроллеры
bin/rails generate controller --help
bin/rails generate controller user login:string age:integer

# Миграции
bin/rails db:create
bin/rails db:drop
bin/rails db:setup
bin/rails db:migrate
bin/rails db:seed

# Scaffold
bin/rails generate scaffold User name:string age:integer

# Удаление
bin/rails destroy

# Еще команды
bin/rails console
bin/rails test
bin/rails dbconsole
