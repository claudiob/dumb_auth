require 'rails/generators/migration'

module DumbAuth
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      include Rails::Generators::Migration
      source_root File.expand_path('../templates', __FILE__)
      desc 'Add the Identity table required by DumbAuth'

      def self.next_migration_number(path)
        @prev_migration_nr = Time.now.utc.strftime("%Y%m%d%H%M%S").to_s
      end

      def copy_migrations
        migration_template "create_identities.rb", "db/migrate/create_identities.rb"
      end
    end
  end
end