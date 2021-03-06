# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "better_sjr/version"

Gem::Specification.new do |spec|
  spec.name          = "better_sjr"
  spec.version       = BetterSJR::VERSION
  spec.authors       = ["Carlos Ramirez III"]
  spec.email         = ["carlos.e.ramirez.iii@gmail.com"]

  spec.summary       = %q{Improvements to server-generated JavaScript (SJR) responses in Rails}
  spec.homepage      = "https://github.com/carlosramireziii/better_sjr"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.1.0"

  if RUBY_VERSION < "2.2.2"
    spec.add_development_dependency "activesupport", "< 5"
  else
    spec.add_development_dependency "activesupport"
  end
  spec.add_development_dependency "appraisal", "~> 2.1"
  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "combustion", "~> 0.5"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rspec-rails", "~> 3.5"
end
