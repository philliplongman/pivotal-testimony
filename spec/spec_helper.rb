require 'pry'
require 'rspec'
require 'capybara/rspec'

require_relative 'app'

set :environment, :test

Capybara.app = Sinatra::Application
