# -*- encoding: utf-8 -*-
require File.expand_path('../lib/active_record/auto_defaults/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Simon COURTOIS"]
  gem.email         = ["scourtois@cubyx.fr"]
  gem.description   = %q{Sets the default values of nil attributes based on the database schema.}
  gem.summary       = %q{Sets the default values of nil attributes based on the database schema.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "activerecord-auto_defaults"
  gem.require_paths = ["lib"]
  gem.version       = ActiveRecord::AutoDefaults::VERSION

  gem.add_dependency 'activerecord',  '~> 3.0'
  gem.add_dependency 'activesupport', '~> 3.0'
  gem.add_dependency 'railties',      '~> 3.0'
end
