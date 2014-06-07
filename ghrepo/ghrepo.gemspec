# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ghrepo/version'

Gem::Specification.new do |spec|
  spec.name          = "ghrepo"
  spec.version       = Ghrepo::VERSION
  spec.authors       = ["bob"]
  spec.email         = ["exa@example.com"]
  spec.description   = %q{it doesn't suck}
  spec.summary       = %q{it doesn't suck}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "debugger"

end
