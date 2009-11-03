# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_rgweb_session',
  :secret      => 'bdec0cea46bcab48dfc79a71ac2b6c9287432d63a54d4d90190b83707a43ac1371dc75aaba8c1baeb3499afa431f425a66a8028fd0373584b7c4ebc3f59cfeff'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
