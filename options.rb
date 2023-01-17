require_relative 'app'

class Options
  def initialize(app)
    @app = app
  end

  def options
    @app.display_options
  end
end