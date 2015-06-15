# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'slim/builder/version'

Gem::Specification.new do |spec|
  spec.name          = "slim-builder"
  spec.version       = Slim::Builder::VERSION
  spec.authors       = ["Guy Boertje"]
  spec.email         = ["guyboertje@gmail.com"]
  spec.summary       = %q{A Builder DSL to create Slim based components in Ruby (like JsonBuilder).}
  spec.description   = %q{A Builder DSL to create Slim based components in Ruby (like JsonBuilder).}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "slim"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.7.0"
end
