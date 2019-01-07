require 'byebug-cleaner.rb'

namespace :byebug do
  desc "Remove all byebug commands, 'byebug:clean -- -h' for more details."
  task :clean do
    ByebugCleaner::Cleaner.clean(ARGV)
  end
end
