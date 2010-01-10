CUSTOM_DATETIME_FORMATS = {
  :sql_format => "%Y-%m-%d %H:%M:%S",
  :default    => "%b. %e, %Y %l:%M%p %Z",
  :long_html  => "<span class='weekday'>%a,</span> <span class='date'>%B %d, %Y</span> <span class='time'>%I:%M %p</span>",
  :short_html => "<span class='date'>%b %d</span> <span class='time'>%H:%M:%S</span>"
}

[ ActiveSupport::CoreExtensions::Time::Conversions::DATE_FORMATS,
  ActiveSupport::CoreExtensions::Date::Conversions::DATE_FORMATS
].each do |h|
  h.merge!(CUSTOM_DATETIME_FORMATS)
end