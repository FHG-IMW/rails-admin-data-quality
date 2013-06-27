# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails_admin_data_quality/version'

Gem::Specification.new do |spec|
  spec.name          = "rails_admin_data_quality"
  spec.version       = RailsAdminDataQuality::VERSION
  spec.authors       = ["Max Kiessling"]
  spec.email         = ["max.kiessling@moez.fraunhofer.de"]
  spec.description   = %q{Adds a view to rails admin that shows your models data quality}
  spec.summary       = %q{Data quality views for rails admin}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib","app"]

  spec.add_dependency "rails_admin"
  spec.add_dependency "data_quality"

  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "devise"
end
