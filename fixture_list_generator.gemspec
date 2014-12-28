# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fixture_list_generator/version'

Gem::Specification.new do |spec|
  spec.name          = "fixture_list_generator"
  spec.version       = FixtureListGenerator::VERSION
  spec.authors       = ["Greg Stewart"]
  spec.email         = ["gregs@tcias.co.uk"]
  spec.summary       = %q{Fixture List Generator}
  spec.description   = %q{A gem to generate a fixture list from a list of IDs}
  spec.homepage      = "https://github.com/gregstewart/fixture_list_generator"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
