$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "lint/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "lint"
  s.version     = Lint::VERSION
  s.authors     = ["James R. Bracy"]
  s.email       = ["waratuman@gmail.com "]
  s.homepage    = "http://github.com/waratuman/lint"
  s.summary     = "JavaScript Linter for Rails"
  s.description = "JavaScript Linter for Rails based off JSLint"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency 'rails', ">= 4.0.0"
  s.add_dependency 'execjs'
  s.add_dependency 'multi_json'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'sqlite3'
end
