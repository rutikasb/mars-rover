#!/usr/bin/env rake

require 'rspec/core/rake_task'
require File.expand_path('../application', __FILE__)

RSpec::Core::RakeTask.new(:spec)

desc "Run the app with input from file or in interactive mode"
task :test do
  Application.new.run
end
