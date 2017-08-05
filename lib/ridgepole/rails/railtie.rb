require 'rails/railtie'
require 'ridgepole/rails'
require 'ridgepole/rails/config'

class Ridgepole::Rails::Railtie < ::Rails::Railtie
  config.app_generators.orm :ridgepole

  config.ridgepole = Ridgepole::Rails::Config.new

  rake_tasks do
    load File.join(File.dirname(__FILE__), 'tasks', 'ridgepole.rake')
    load File.join(File.dirname(__FILE__), 'tasks', 'override.rake') if Rails.application.config.ridgepole.override_db_tasks
  end
end
