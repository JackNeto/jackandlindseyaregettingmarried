RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.gem 'haml'
  config.gem 'jrails'
  config.gem 'httparty'
  config.gem 'haml'
  config.gem 'calendar_date_select'
  config.gem 'thoughtbot-paperclip',  :lib => 'paperclip'
  config.gem 'mislav-will_paginate',  :lib => 'will_paginate'
  config.gem 'active_link_to'
  config.gem 'comfortable_mexican_sofa'
  config.gem 'authlogic'
  
  config.time_zone = 'UTC'
end