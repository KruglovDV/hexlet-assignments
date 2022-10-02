# Для работы Webpacker нужен NodeJS + yarn
# https://github.com/Hexlet/instructions/blob/main/nodejs.md
# https://yarnpkg.com/getting-started/install


# Gemfile
# gem 'webpacker', '~> 6.0'

# OR if you prefer to use master
# gem 'webpacker', git: 'https://github.com/rails/webpacker.git'
yarn add https://github.com/rails/webpacker.git

./bin/bundle install
./bin/rails webpacker:install
yarn install

# Help генерации нового приложения
rails new -h

# С 6 версии Webpacker ставится по дефолту
rails new webpacker-app
rails new webpacker-app-vue --webpacker=vue
rails new webpacker-app-angular --webpacker=angular

# С 6 версии Webpacker ставится по дефолту, убрать его можно флагом
rails new without-webpacker-app --skip-webpacker-install
cd without-webpacker-app
bin/rails webpacker:install:react

rails new webpacker-app
cd webpacker-app

bin/webpack
# Запуск dev сервера для hot-reloading
bin/webpack-dev-server

# Запускается также webpack-dev-server
bin/rails s

# Эти команды запускаются при каждом запросе при запущенном дев-сервере
# удаляются скомпилированные файлики
bin/rails assets:clobber
# Сборка ассетов
bin/rails webpacker:compile

mkdir app/assets/javascripts
bin/rails js:routes
