# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rubygems/manifest'

Gem::Specification.new do |spec|
  manifest = Rubygems::Manifest.new
  manifest.check

  spec.name          = "rubygems-manifest"
  spec.version       = Rubygems::Manifest::VERSION
  spec.authors       = ["Wojciech Mach"]
  spec.email         = ["wojtek@wojtekmach.pl"]
  spec.description   = "Create Manifest.txt"
  spec.summary       = "Create Manifest.txt"
  spec.homepage      = "https://github.com/wojtekmach/rubygems-manifest"
  spec.license       = "MIT"

  spec.files         = manifest.files
  spec.executables   = manifest.executables
  spec.test_files    = manifest.test_files
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
