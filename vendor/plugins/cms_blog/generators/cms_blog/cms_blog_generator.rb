class CmsBlogGenerator < Rails::Generator::Base
  def manifest
    record do |m|
      
      # moving database migration
      if Dir.glob("db/migrate/[0-9]*_*.rb").grep(/[0-9]+_create_cms_blog.rb$/).empty?
        m.migration_template 'migrations/create_cms_blog.rb', 'db/migrate', :migration_file_name => 'create_cms_blog'
      else
        puts "WARNING: Migration 'create_cms_blog' already exists. Manually adjust it, or remove it."
      end
      
      # some reading material
      m.readme 'README'
      
    end
  end
end