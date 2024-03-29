# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'clearhead/version'

Gem::Specification.new do |spec|
  spec.name          = "clearhead"
  spec.version       = Clearhead::VERSION
  spec.authors       = ["tomhanlon"]
  spec.email         = ["tomhanlon@gmail.com"]
  spec.summary       = %q{Generate new experiment files with ease}
  spec.description   = %q{Generate new experiment files with ease}
  spec.homepage      = "https://github.com/tomhanlon/experiment-generator"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
