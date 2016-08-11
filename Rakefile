# RSpec

begin
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec do |task|
    task.pattern = Dir['spec/**/*_spec.rb']
  end
rescue LoadError
end

task default: ['spec']


# Asset Pipeline

require 'bundler/setup'
Bundler.require :default, :development
require_relative "lib/feature"
require_relative "lib/line_wrapper"
require_relative 'app'

require 'sinatra/asset_pipeline/task'
Sinatra::AssetPipeline::Task.define!(PivotalTestimony)
