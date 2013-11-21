$:.unshift File.dirname(__FILE__) + 'lib'
require "bundler/gem_tasks"

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new
task :default => :spec

desc "Ejecutar las espectativas de la clase Fraccion"
task :spec do
  #sh "rspec -I. spec/fraccion_spec.rb"
end

desc "Ejecutar con documentacion"
task :doc do
  #sh "rspec -I. spec/fraccion_spec.rb --format documentation"
end

desc "Run /lib/frac_main.rb"
task :bin do
  sh "rspec -I. lib/prct09/prct09.rb"
end

desc "Run test with --format: documentation"
task :test do
  #sh "rspec -I. spec/fraccion_spec.rb --format documentation"
end

desc "Run test with --format: html"
task :thtml do
  #sh "rspec -I. spec/fraccion_spec.rb --format html > Fraccion_spec.html"
end