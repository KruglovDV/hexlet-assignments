# Gemfile

gem 'faker'

# db/seeds.rb

100.times do
  Post.create(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph
  )
end

# Gemfile


group :development do
  # ...
  gem 'capistrano', require: false
  gem 'capistrano-puma', require: false
  gem 'capistrano-rails', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-rvm', require: false
end


# Capfile

require "capistrano/setup"
require "capistrano/deploy"
require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git

require "capistrano/rails/migrations"
require "capistrano/bundler"
require "capistrano/rvm"
require "capistrano/puma"

# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }


# config/deploy.rb

lock "~> 3.16.0"

set :rvm_ruby_version, '3.0.1'
set :application, 'simple-blog'
set :repo_url, 'https://github.com/username/simple-blog.git'
set :deploy_to, 'var/www/simple-blog'
server '<server_ip>', user: 'root', roles: %w{ app db web }
append :linked_files, "config/master.key"
set :linked_dirs, %w{log tmp/backup tmp/pids tmp/cache tmp/sockets vendor/bundle}
set :rvm_map_bins, %w{gem rake ruby rails bundle}

set :branch, :master
set :rails_env, :production


# config/deploy/staging.rb

namespace :deploy do
  desc 'reload the database with seed data'
  task :seed do
    on roles(:all) do
      within current_path do
        execute :bundle, :exec, 'rails', 'db:seed', 'RAILS_ENV=PRODUCTION'
      end
    end
  end
end

namespace :deploy do
  desc 'run server'
  task :run do
    on roles(:all) do
      within current_path do
        with rails_env: :production do
          execute :bundle, :exec, 'server', '-p', '3001'
        end
      end
    end
  end
end

# Gemfile

# Для хероку нужна версия ruby
ruby '3.0.2'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Для деплоя на Heroku sqlite3 не должен устанавливаться для продакшена
  gem 'sqlite3', '~> 1.4'
end

group :production do
  # Для продакшена
  gem 'pg'
end
