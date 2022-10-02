# https://github.com/rails/webpacker
# Gemfile
gem 'webpacker', '~> 6.0'

# https://github.com/railsware/js-routes
gem "js-routes"

# app/views/layouts/application.html.erb
# stylesheet_link_tag - хелпер Sprockets, для webpacker используется другой хелпер
stylesheet_link_tag 'application', media: 'all', 'data-turbolinks-track': 'reload'
# stylesheet_pack_tag - хелпер Webpacker для стилей
stylesheet_pack_tag 'application'
javascript_pack_tag 'application'
# Если файл должен подключаться отдельно, то он должен находиться внутри  директории packs
javascript_pack_tag 'hello2'
