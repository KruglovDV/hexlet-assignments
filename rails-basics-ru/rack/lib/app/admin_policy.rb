# frozen_string_literal: true

class AdminPolicy
  def initialize(app)
    @app = app
  end

  def call(env)
    # BEGIN
    req = Rack::Request.new env
    return [403, {}, []] if req.path.match? /^\/admin.*/
    @app.call env
    # END
  end
end
