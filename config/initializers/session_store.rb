# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_filo2_session',
  :secret      => 'e3b1aece455d7c30f7a3f76c299d7e92874b5376cd5bc817224e399d28adfa93fa9768c9be2c916ee1cf3a20c4e969dd338b5b3e71a4736f6d45915bb5d67ff4'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
