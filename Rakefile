require 'bundler'
require 'rspec/core/rake_task'
require 'rake/rdoctask'

Bundler::GemHelper.install_tasks

task :default => :spec
RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = ["--format documentation"]
end

Rake::RDocTask.new do |t|
  t.main = "README.md"
  t.rdoc_files.include("README.md", "lib/**/*.rb")
  t.options << "--accessor=property"
end
