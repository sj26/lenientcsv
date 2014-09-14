# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lenient_csv/version'

Gem::Specification.new do |spec|
  spec.name          = "lenientcsv"
  spec.version       = LenientCSV::VERSION
  spec.authors       = ["Samuel Cochran"]
  spec.email         = ["sj26@sj26.com"]
  spec.summary       = %q{Lenient CSV parsing}
  spec.description   = %q{CSV parser supporting both RFC 4180 double double-quote and unix-style backslash escaping}
  spec.homepage      = "https://github.com/sj26/lenientcsv"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake", "~> 10.3"
  spec.add_development_dependency "rspec", "~> 3.0"
end
