# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "puppetdash-rundeck"
  spec.version       = "1.0.0"
  spec.authors       = ["skylost"]
  spec.email         = ["skylost@users.noreply.github.com"]
  spec.summary       = %q{Integrates Puppet Dashboard with Rundeck.}
  spec.description   = %q{ Provides a resource endpoint for Rundeck from a Puppet Dashboard.}
  spec.homepage      = "https://github.com/skylost/puppetdash-rundeck"
  spec.license       = "MIT"
  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
