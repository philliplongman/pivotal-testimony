begin
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec do |task|
    task.pattern = Dir['spec/**/*_spec.rb']
  end
rescue LoadError
end

task default: ['spec']



require_relative 'application'

require 'sinatra/asset_pipeline/task'
Sinatra::AssetPipeline::Task.define!(Application)
