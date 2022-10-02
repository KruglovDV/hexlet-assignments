class ExecutionTimer
  def initialize(app)
    @app = app
  end

  def call(env)
    before = (Time.now.to_f * 1000).to_i
    status, headers, body = @app.call(env)
    after = (Time.now.to_f * 1000).to_i
    execution_time = "\nexecution time - #{after - before}\n"
    [status, headers, body.append(execution_time)]
  end
end