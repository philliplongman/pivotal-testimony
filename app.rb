require "dotenv"
Dotenv.load

require "sinatra"
require "sinatra/reloader"
require "slim"
require "tracker_api"

configure :development, :test do
  require "pry"
end

Dir[File.join(File.dirname(__FILE__), "lib", "**", "*.rb")].each do |file|
  require file
  also_reload file
end

client = TrackerApi::Client.new(token: ENV['API_TOKEN'])
project = client.project(ENV['PROJECT'])

get "/" do
  @title = project.nmae
  slim :index
end
