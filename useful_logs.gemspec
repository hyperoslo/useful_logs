$LOAD_PATH.push File.expand_path('../lib', __FILE__)

require 'useful_logs/version'

Gem::Specification.new do |s|
  s.name        = 'useful_logs'
  s.version     = UsefulLogs::VERSION
  s.authors     = ['Felipe Espinoza']
  s.email       = ['fespinozacast@gmail.com']
  s.homepage    = 'https://github.com/hyperoslo/useful_logs'
  s.summary     = 'A collection of good practices for logs in Rails.'
  s.description = s.summary
  s.license     = 'MIT'

  s.files = Dir[
    '{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md'
  ]

  s.add_dependency 'rails', '>= 4.2.6'
  s.add_dependency 'lograge', '~> 0.4'
  s.add_dependency 'configatron', '~> 4.5'

  s.add_development_dependency 'pry'
  s.add_development_dependency 'pry-rails'
  s.add_development_dependency 'rubocop', '~> 0.44.1'
end
