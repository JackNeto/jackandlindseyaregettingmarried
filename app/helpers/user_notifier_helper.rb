module UserNotifierHelper
  
  def email_tag(type, options = {}, &block)
    content = capture(&block)
    
    style = case type.to_sym
    when :h1
      'font: bold 24px Lucida Grande, Helvetice, Arial, serif; color:#f4a33a;'
    when :h1
      'font: bold 20px Lucida Grande, Helvetice, Arial, serif; color:#9eb74a;'
    when :p
      'font: normal 12px Lucida Grande, Helvetica, Arial, sans-serif; line-height:1.6em; color:#4d4d4d; margin: 10px 0'
    when :a
      'font: 18px/25px Lucida Grande, Helvetica, Arial, serif; color: #9eb74a'
    end
    options = {:style => style}.merge!(options)
    
    content_tag(type, content, options)
  end

end