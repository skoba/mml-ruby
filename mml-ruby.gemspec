# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mml/ruby/version'

Gem::Specification.new do |spec|
  spec.name          = "mml-ruby"
  spec.version       = Mml::Ruby::VERSION
  spec.authors       = ["Shinji KOBAYASHI"]
  spec.email         = ["skoba@moss.gr.jp"]
  spec.description   = %q{Ruby implementation of MML(Medical Markup Language) library}
  spec.summary       = %q{MML implementation by Ruby}
  spec.homepage      = ""
  spec.license       = "Apache2"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.add_dependency "builder"
  spec.add_dependency 'nokogiri'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
