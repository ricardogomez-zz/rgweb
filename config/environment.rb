# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.4' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  #config.gem 'RedCloth', :version => '3.0.4'
  config.gem 'less'
  config.time_zone = 'UTC'

 config.action_controller.session = {
    :session_key => '_ricardogomez_session',
    :secret      => 'd2a56a1d57b98d43ebeff6c2ee53dcebf7257026f1173f99653be71e0199fc28f152be0717230933844416eb6fea8de47c4c60aed25cbfa2722fe8fe891ef944'
  }

  config.action_controller.page_cache_directory = RAILS_ROOT + "/public/cache/"
end