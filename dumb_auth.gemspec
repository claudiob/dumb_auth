$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "dumb_auth/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "dumb_auth"
  s.version     = DumbAuth::VERSION
  s.authors     = ['claudiob']
  s.email       = ['claudiob@gmail.com']
  s.homepage    = 'http://github.com/claudiob/dumb_auth'
  s.summary     = 'The dumbest authentication gem ever!'
  s.description = 'Provides two routes (POST login, DELETE logout) and a controller method/helper logged_in?'

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 4.0.0.rc1"
  s.add_dependency 'omniauth-identity'
  # s.add_dependency "omniauth-twitter"
  # s.add_dependency "omniauth-facebook"
  s.add_dependency "omniauth-twitter"
  s.add_dependency 'bcrypt-ruby', '~> 3.0.0' # used by omniauth-identity 'has_secure_password'
  s.add_development_dependency 'sqlite3'
end
