class Paperclip::Attachment
  def self.default_options
    @default_options ||= {
      :url           => "/:attachment/:id/:style/:filename",
      :path          => ":rails_root/public:url",
      :styles        => {},
      :default_url   => "/:attachment/default_:style.gif",
      :default_style => :original,
      :validations   => [],
      :storage       => :filesystem,
      :whiny         => Paperclip.options[:whiny] || Paperclip.options[:whiny_thumbnails]
    }
  end
end


if (File.exist?('/opt/local/bin'))
  Paperclip.options[:command_path] = '/opt/local/bin'
end
