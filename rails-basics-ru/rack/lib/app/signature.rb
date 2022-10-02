# frozen_string_literal: true

require 'digest'

class Signature
  def initialize(app)
    @app = app
  end

  def call(env)
    # BEGIN
    status, headers, body = @app.call env
    hash =  Digest::SHA2.new(256).hexdigest body[0]
    [status, headers, body.append(hash)]
    # END
  end
end
