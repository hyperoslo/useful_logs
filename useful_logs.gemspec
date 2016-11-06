$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "useful_logs/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "useful_logs"
  s.version     = UsefulLogs::VERSION
  s.authors     = ["Felipe Espinoza"]
  s.email       = ["fespinozacast@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of UsefulLogs."
  s.description = "TODO: Description of UsefulLogs."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.0", ">= 5.0.0.1"
end
