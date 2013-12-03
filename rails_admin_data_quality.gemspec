# coding: utf-8
$:.push File.expand_path("../lib", __FILE__)

require 'rails_admin_data_quality/version'

Gem::Specification.new do |spec|
  spec.name          = "rails_admin_data_quality"
  spec.version       = RailsAdminDataQuality::VERSION
  spec.authors       = ["Max Kiessling"]
  spec.email         = ["max.kiessling@moez.fraunhofer.de"]
  spec.description   = %q{Adds a view to rails admin that shows your models data quality}
  spec.summary       = %q{Data quality views for rails admin}

  spec.files = Dir["{app,config,db,lib}/**/*"] + ["Rakefile"]
  spec.test_files = Dir["test/**/*"]

  spec.add_dependency "rails_admin"
  spec.add_dependency "data_quality"

  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "devise"
  spec.add_development_dependency "therubyracer"
end