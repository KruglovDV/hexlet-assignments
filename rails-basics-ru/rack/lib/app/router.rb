# frozen_string_literal: true

require 'rack'

class Router
  def call(env)
    # BEGIN
    req = Rack::Request.new(env)
    case req.path
    when '/'
      [200, {}, ['Hello, World!']]
    when '/about'
      [200, {}, ['About page']]
    else
      [404, {}, ['404 Not Found']]
    end
    # END
  end
end
