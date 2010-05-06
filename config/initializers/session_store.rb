# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_oursaviorhaddonfield_session',
  :secret      => '83f5ab66dca7f8d4d37a5a7e02d3ebb6d08276279fa22cc29affa533511841a12d7b10adc2592e56caf7ffaf3c2ed72b5997089438881c30a1c0bc592c2c6a5d'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
