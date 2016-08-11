ENV['RACK_ENV'] ||= 'development'

require 'bundler/setup'
Bundler.require :default, ENV['RACK_ENV'].to_sym

Dotenv.load if development?

require_relative "lib/feature"
require_relative "lib/line_wrapper"
require_relative "app"

run PivotalTestimony
