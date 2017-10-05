# frozen_string_literal: true

require 'rails/generators/active_record/model/model_generator'

module Rails
  module Generators
    class RidgepoleGenerator < ActiveRecord::Generators::ModelGenerator
      IGNORE_ATTRIBUTE_OPTIONS = %i[foreign_key]

      def self.source_paths
        [ActiveRecord::Generators::ModelGenerator.source_root, File.expand_path('../templates', __FILE__)]
      end

      def create_migration_file
        return unless options[:migration] && options[:parent].nil?
        attributes.each { |a| a.attr_options.delete(:index) if a.reference? && !a.has_index? } if options[:indexes] == false

        template 'schema.rb', File.join('db/schema', class_path, "#{file_name}.rb")
      end

      private

      def options_for_attribute(attribute)
        opts = attribute.options_for_migration.
          except(*IGNORE_ATTRIBUTE_OPTIONS).
          map { |k, v| "#{k}: #{v.inspect}" }.
          join(', ')

        opts.present? ? ", #{opts}" : ""
      end
    end
  end
end
