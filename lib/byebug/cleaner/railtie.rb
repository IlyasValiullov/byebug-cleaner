class Railtie < Rails::Railtie
  rake_tasks do
    load 'tasks/clean_tasks.rake'
  end
end