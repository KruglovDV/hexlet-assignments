# Запуск приложения в определенном окружении
# Также задать окружение можно переменной окружения RAILS_ENV
bin/rails s -e staging_unmerged
# Для запуска приложения в новом окружении требуется добавить окружение для webpack и БД
# => `resolve_symbol_connection': The `staging_unmerged` database is not configured for the `staging_unmerged` environment. (ActiveRecord::AdapterNotSpecified)

# => Available databases configurations are:

# => default
# => development
# => test
# => production


bin/rails s -e staging_unmerged

RAILS_ENV=staging_unmerged bin/rails c

# https://github.com/aws/aws-sdk-ruby

bin/rails c

# Хранение секретов
# Редактирование зашифрованного config/credentials.yml.enc
# Файл шифруется с помощью config/master.key
EDITOR=vim bin/rails credentials:edit

# Spring
# Добавление и удаление Spring из бинарных файлов
bundle exec spring binstub --all
bin/spring binstub --remove --all

bin/rails restart

# https://puma.io/
