class Railtie < Rails::Railtie
 	rake_tasks do
    load 'tasks/byebug_cleaner_tasks.rake'
  end
end