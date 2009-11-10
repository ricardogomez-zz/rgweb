# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  helper_method :sections

  SECTIONS = ['inicio', 'websamigas', 'conferencias', 'paraleer', 'mislibros', 'premios', 'biografia',
    'encuentros', '---', 'contacto', 'el sáhara']

  SECTIONS_OLD = ['inicio', 'paraviajar', 'paraleer', 'mislibros', 'premios', 'biografia', 'contacto', 'critica']

  protected
  def sections
    SECTIONS
  end

  def login_required
    authenticate_or_request_with_http_basic do |username, password|
      username == "ricardo" && password == "entrar"
    end
  end
end
