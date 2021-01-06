# frozen_string_literal: true

%w[
  db:migrate
  db:migrate:status
  db:rollback
  db:schema:cache:clear
  db:schema:cache:dump
  db:schema:dump
  db:schema:load
  db:setup
  db:structure:dump
  db:structure:load
  db:version
].each do |task|
  Rake::Task[task].clear
end

namespace :db do
  def alias_task(new, old)
    desc Rake::Task[old].comment
    task new, [*Rake.application[old].arg_names] => [old]
  end

  {
    migrate: 'ridgepole:apply',
    setup: 'ridgepole:setup'
  }.each_pair do |new, old|
    alias_task(new, old)
  end
end
