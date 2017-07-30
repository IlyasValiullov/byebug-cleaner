$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "byebug/cleaner/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "byebug-cleaner"
  s.version     = ByebugCleaner::VERSION
  s.authors     = ["Ilyas Valiullov"]
  s.email       = ["ilyas.valiullov@gmail.com"]
  s.homepage    = "https://github.com/IlyasValiullov/byebug-cleaner"
  s.summary     = "Gem for clean byebug tag from source code."
  s.description = "Remove byebug tag before push your code in repos."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5"
end

