require 'rspec/core/rake_task'
require 'bundler/gem_tasks'

RSpec::Core::RakeTask.new(:spec) do |task|
  task.rspec_opts = ['--color']
end

task :default => :spec

task :console do
  require 'pry'
  require 'camara'

  def reload!
    files = $LOADED_FEATURES.select { |feat| feat =~ /\/camara\// }
    files.each { |file| load file }
    true
  end

  ARGV.clear
  Pry.start
end

task c: :console
