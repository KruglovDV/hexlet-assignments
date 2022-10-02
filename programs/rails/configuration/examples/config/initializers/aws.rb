# Инициалайзеры запускаются, когда приложение полностью загружено
# https://guides.rubyonrails.org/configuring.html#initialization-events
# Выполнить код в определенные моменты загрузки приложения
Rails.application.config.before_initialize do
  # initialization code goes here
end
Aws.config.update(
  region: 'us-west-2',
  credentials: Aws::Credentials.new('akid', 'secret')
)
