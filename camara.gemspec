# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'camara/version'

Gem::Specification.new do |spec|
  spec.name          = "camara"
  spec.version       = Camara::VERSION
  spec.authors       = ["Dimas Cyriaco"]
  spec.email         = ["dimascyriaco@gmail.com"]
  spec.summary       = %q{Camara é uma biblioteca para acesso aos webservices da Camera dos Deputados.}
  spec.description   = %q{Camara é uma biblioteca para acesso aos webservices da Camera dos Deputados.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "pry"
  spec.add_dependency 'activesupport'
  spec.add_dependency 'faraday'
  spec.add_dependency 'nokogiri'
end
