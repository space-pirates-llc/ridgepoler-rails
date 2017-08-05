# frozen_string_literal: true

require 'rails/generators/active_record/model/model_generator'

module Rails
  module Generators
    class RidgepoleGenerator < ActiveRecord::Generators::ModelGenerator
      def self.source_paths
        [ActiveRecord::Generators::ModelGenerator.source_root, File.expand_path('../templates', __FILE__)]
      end

      def create_migration_file
        return unless options[:migration] && options[:parent].nil?
        attributes.each { |a| a.attr_options.delete(:index) if a.reference? && !a.has_index? } if options[:indexes] == false

        template 'schema.rb', File.join('db/schema', class_path, "#{file_name}.rb")
      end
    end
  end
end
