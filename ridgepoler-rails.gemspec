# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'ridgepoler/rails/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'ridgepoler-rails'
  s.version     = Ridgepoler::Rails::VERSION
  s.authors     = ['Sho Kusano']
  s.email       = ['sho-kusano@space-pirates.jp']
  s.homepage    = 'https://github.com/space-pirates-llc/ridgepoler-rails'
  s.summary     = 'Provides integration between ridgepole and rails 5 newer'
  s.description = s.summary
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rails', '>= 5.0.0'
  s.add_dependency 'ridgepole'

  s.add_development_dependency 'sqlite3'
end
