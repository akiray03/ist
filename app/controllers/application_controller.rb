class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :preset_variables
  def preset_variables
    @app_name = APP_NAME ? APP_NAME : "Ist"
    @hostname = request.env['HTTP_HOST']
    scheme = URI.parse(request.env['REQUEST_URI']).scheme
    @host_uri = scheme + '://' + @hostname
  end
end
