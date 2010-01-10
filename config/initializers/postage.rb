
# Specify the Postage API key
Postage.configure do |config|
  config.api_key = '50EzZ7yQYXnt5CZS6WcXJ9yLg6kqG7MJ'
  case Rails.env
    when   'development'
      config.url = 'http://twg.postageapp.local'
    when   'staging'
      config.url = 'http://api.postageapp.staging.twg.ca'
  end
end
