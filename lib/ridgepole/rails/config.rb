require 'ridgepole/rails'

class Ridgepole::Rails::Config
  def debug
    return @debug if instance_variable_defined?(:@debug)

    @debug = false
  end
  attr_writer :debug

  def verbose
    return @verbose if instance_variable_defined?(:@verbose)

    @verbose = false
  end
  attr_writer :verbose

  def options
    return @options if instance_variable_defined?(:@options)

    @options = []
  end
  attr_writer :options

  def root
    return @root if instance_variable_defined?(:@root)

    @root = 'db/Schemafile'
  end
  attr_writer :root

  def override_db_tasks
    return @override_db_tasks if instance_variable_defined?(:@override_db_tasks)

    @override_db_tasks = true
  end
  attr_writer :override_db_tasks
end
