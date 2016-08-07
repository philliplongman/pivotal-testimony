source "https://rubygems.org"

ruby "2.3.1"

gem "bundler"
gem "sinatra", require: ["sinatra", "sinatra/base"]
gem "sinatra-contrib", require: ["sinatra/reloader", "sinatra/cookies"]
gem "sinatra-asset-pipeline", require: "sinatra/asset_pipeline"
gem "actionview", require: "action_view"
gem "rake"
gem "puma"
gem "slim"
gem "uglifier"
gem "tracker_api"

group :development do
  gem "better_errors"
  gem "binding_of_caller"
end

group :test, :development do
  gem "dotenv"
  gem "pry"
  gem "capybara"
  gem "rspec"
  gem "launchy"
end
