# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name        = "file_backup"
  s.version     = "1.0.0"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Marcin Nowicki"]
  s.email       = ["pr0d1r2@gmail.com"]
  s.homepage    = "http://github.com/doubledrones/file_backup"
  s.summary     = "Simple file backup mechanism written as extension to File class."
  s.description = "Simple file backup mechanism written as extension to File class."

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "file_backup"

  s.add_development_dependency "rspec"

  s.files        = Dir.glob("{lib,spec}/**/*") + %w(README)
  s.require_path = 'lib'
end
