source "https://rubygems.org"

ruby "2.3.1"

gem "bundler"
gem "sinatra", require: ["sinatra", "sinatra/base"]
gem "sinatra-contrib", require: "sinatra/reloader"
gem "sinatra-asset-pipeline", require: "sinatra/asset_pipeline"
gem "actionview", require: "action_view"
gem "rake"
gem "puma"
gem "slim"
gem "uglifier"
gem "tracker_api"
gem "encrypted_cookie"

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

group :production do
  gem 'rails_12factor'
end
