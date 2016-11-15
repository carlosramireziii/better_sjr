# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'better_sjr/version'

Gem::Specification.new do |spec|
  spec.name          = "better_sjr"
  spec.version       = BetterSJR::VERSION
  spec.authors       = ["Carlos Ramirez III"]
  spec.email         = ["carlos.e.ramirez.iii@gmail.com"]

  spec.summary       = %q{Improvements to Rails' built-in Server-side JavaScript Response (SJR) system}
  spec.homepage      = "https://github.com/carlosramireziii/better_sjr"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  if RUBY_VERSION < '2.2.2'
    spec.add_development_dependency "activesupport", "< 5"
  else
    spec.add_development_dependency "activesupport"
  end
  spec.add_development_dependency "appraisal", "~> 2.1.0"
  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "combustion", "~> 0.5.5"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rspec-rails", "~> 3.5.0"
end
