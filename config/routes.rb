ActionController::Routing::Routes.draw do |map|
  map.connect ':controller/service.wsdl', :action => 'wsdl'

  map.connect '/', :controller => 'ver', :action => 'show', :section => 'inicio'
  map.connect '/ver/:section/:page', :controller => 'ver', :action=>'show'
  map.connect '/ver/:section', :controller => 'ver', :action=>'show'
  map.connect ':controller/:action/'
  map.connect ':controller/:action/:section'
  map.connect ':controller/:action/:section/:page'
end
