GOOGLE_MAPS_KEY = case Rails.env
  when 'production'
    'ABQIAAAANml_u1T7otZCi2jGJOaEfBTdUDJwbxNQ3tC4lvTARb4KSkuxWBQKFi2AFZl9Y4eg63NT-s2E8l507g'
  when 'development'
    'ABQIAAAANml_u1T7otZCi2jGJOaEfBRZpSDZPE6hhqNv2qkoH8civZieLxSYO68y-trjRqdPO0WY-h_N1ibirQ'
  end