# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lazy_timed_threadlocal/version'

Gem::Specification.new do |spec|
  spec.name          = "lazy_timed_threadlocal"
  spec.version       = LazyTimedThreadlocal::VERSION
  spec.authors       = ["Shawn Stephens"]
  spec.email         = ["shawn@motivatedcompany.com"]
  spec.summary       = %q{Lazily initializes a proc attaching it to the current thread. Also allows a a timeout proc for execution when retrieving a stored object that hasn't been used a configurable number of seconds since the former request.}
  spec.description   = %q{Lazy initializes a proc attaching it to the current thread. Also allows a a timeout proc for execution when retrieving a stored object that hasn't been used a configurable number of seconds since the former request.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
