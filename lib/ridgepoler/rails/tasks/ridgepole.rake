# frozen_string_literal: true

namespace :ridgepole do
  desc 'Creates the database, loads the schema, and initializes with the seed data (use db:reset to also drop the database first)'
  task setup: ['db:create', 'ridgepole:apply', 'db:seed']

  desc 'Migrate the database'
  task apply: [:environment] do
    ridgepole(env: Rails.env)
    ridgepole(env: 'test') if Rails.env.development?
  end

  desc 'Display status of migrations'
  task check: [:environment] do
    ridgepole(env: Rails.env, dry_run: true)
  end

  private

  def ridgepole(env: Rails.env, dry_run: false)
    args = ['ridgepole', '-a']

    if ENV['DATABASE_URL'].to_s.empty?
      args << ['-c', 'config/database.yml', '-E', env]
    else
      args << ['-c', ENV['DATABASE_URL']]
    end

    args.push('--dry-run') if dry_run
    args.push('--debug') if config.debug
    args.push('--verbose') if config.verbose

    args += config.options

    args.push('-f', config.root)

    sh(*args)
  end

  def config
    Rails.application.config.ridgepole
  end
end
