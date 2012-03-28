module AutoDefaults
  module Generators
    class InstallGenerator < Rails::Generators::Base
      def create_initializer_file
        create_file 'config/initializers/activerecord-auto_defaults.rb',
          "ActiveRecord::Base.send(:include, ActiveRecord::AutoDefaults)\n"
      end
    end
  end
end
