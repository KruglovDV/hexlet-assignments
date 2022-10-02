# frozen_string_literal: true

# Load the Rails application.
require_relative 'application'
# BEGIN
require_relative 'rollbar'

notify = lambda do |e|
  Rollbar.with_config(use_async: false) do
    Rollbar.error(e)
  end
rescue StandardError
  Rails.logger.error 'Synchronous Rollbar notification failed.  Sending async to preserve info'
  Rollbar.error(e)
end

begin
  Rails.application.initialize!
rescue Exception => e
  notify.call(e)
  raise
end
# END
