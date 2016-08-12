ENV["RACK_ENV"] ||= "development"

require "bundler/setup"
Bundler.require :default, ENV["RACK_ENV"].to_sym

Dotenv.load if development?

Dir.glob("./lib/*", &method(:require))
Dir.glob("./routes/*", &method(:require))
require_relative "app"

run PivotalTestimony::App
