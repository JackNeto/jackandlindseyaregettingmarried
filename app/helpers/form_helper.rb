module FormHelper  
  
  def formatted_form_for(record_or_name_or_array, *args, &proc)
    options = args.extract_options!
    options.merge!(:builder => FormattedFormBuilder)
    (options[:html] ||= {}).merge!(:class => (options[:html][:class].to_s + ' formatted'))
    form_for(record_or_name_or_array, *(args << options), &proc)
  end
  
  def formatted_remote_form_for(record_or_name_or_array, *args, &proc)
    options = args.extract_options!
    options.merge!(:builder => FormattedFormBuilder)
    (options[:html] ||= {}).merge!(:class => (options[:html][:class].to_s + ' formatted'))
    remote_form_for(record_or_name_or_array, *(args << options), &proc)
  end
  
end
