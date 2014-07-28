# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'default_options/version'

Gem::Specification.new do |spec|
  spec.name          = "default_options"
  spec.version       = DefaultOptions::VERSION
  spec.authors       = ["John Mertens"]
  spec.email         = ["john@versahq.com"]
  spec.summary       = %q{Super simple library provides an easy DSL for setting defaults on optional methods arguments.}
  spec.description   = %q{Implements a simple pattern for creating "options" in Ruby method. Mix it in to a class and use the DSL to setup defaults for methods that can easily be overwritten as needed.}
  spec.homepage      = "https://github.com/mertonium/default_options"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rspec", "~> 3.0.0"
end
