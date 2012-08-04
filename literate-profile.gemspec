# -*- encoding: utf-8 -*-
require File.expand_path('../lib/literate-profile/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Lee Dohm"]
  gem.email         = ["lee@liftedstudios.com"]
  gem.description   = "A Ruby DSL for documenting and generating complicated profiles."
  gem.summary       = "A Ruby DSL for documenting and generating complicated profiles."
  gem.homepage      = "https://github.com/lee-dohm/literate-profile"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "literate-profile"
  gem.require_paths = ["lib"]
  gem.version       = Literate::Profile::VERSION

  gem.add_development_dependency('minitest', '~> 3.3.0')
end
