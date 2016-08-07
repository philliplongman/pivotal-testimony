require 'pry'
require 'rspec'
require 'capybara/rspec'

require_relative '../application.rb'

set :environment, :test

Capybara.app = Sinatra::Application
