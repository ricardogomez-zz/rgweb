# https://developer.uservoice.com/blog/2012/03/04/how-to-upgrade-a-rails-2-3-app-to-ruby-1-9-3/
Encoding.default_external = Encoding.default_internal = Encoding::UTF_8

# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.18' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

# http://djellemah.com/blog/2013/02/27/rails-23-with-ruby-20/
# monkey patch for 2.0. Will ignore vendor gems.
if RUBY_VERSION >= "2.0.0"
  module Gem
    def self.source_index
      sources
    end

    def self.cache
      sources
    end

    SourceIndex = Specification

    class SourceList
      # If you want vendor gems, this is where to start writing code.
      def search( *args ); []; end
      def each( &block ); end
      include Enumerable
    end
  end
end

Rails::Initializer.run do |config|
  #config.gem 'RedCloth', :version => '3.0.4'
  config.gem 'less'
  config.gem 'iconv'

  config.time_zone = 'UTC'

 config.action_controller.session = {
    :session_key => '_rgweb_session',
    :secret      => 'd2a56a1d57b98d43ebeff6c2ee53dcebf7257026f1173f99653be71e0199fc28f152be0717230933844416eb6fea8de47c4c60aed25cbfa2722fe8fe891ef944'
  }

  config.action_controller.page_cache_directory = RAILS_ROOT + "/public/cache/"
end
