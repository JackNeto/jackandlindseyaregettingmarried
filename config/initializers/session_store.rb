# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_wgtg_session',
  :secret      => 'f2867c041fb6d9147864e7b5bea29b72ee6101428a116223e6ca3c56880870cb583b093e5689feff7bc945e441c7999a386d254df5fe3acde1e667f0c570cd6a'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
