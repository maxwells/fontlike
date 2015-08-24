# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fontlike/version'

Gem::Specification.new do |gem|
  gem.name          = "fontlike"
  gem.version       = Fontlike::VERSION
  gem.authors       = ["Max Lahey"]
  gem.email         = ["maxwellslahey@gmail.com"]
  gem.description   = %q{Fontlike bloats your ascii}
  gem.summary       = %q{Fontlike bloats your ascii}
  gem.homepage      = "https://github.com/maxwells/fontlike"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = ['fontlike']
  gem.test_files    = gem.files.grep(%r{^(spec)/})
  gem.require_paths = ["lib"]

  gem.licenses      = ['MIT']

  gem.required_ruby_version = '>= 1.9.3'
end
