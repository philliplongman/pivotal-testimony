require "dotenv"
Dotenv.load

require "sinatra"
require "sinatra/reloader"
require "slim"
require "tracker_api"

require_relative "lib/feature"
require_relative "lib/line_wrapper"

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
  @title = project.name
  slim :index
end

post "/" do
  id = params[:story_id].sub('#', '')
  redirect "/stories/#{id}"
end

get "/stories/:id" do
  @title = project.name
  @feature = Feature.new project.story(params[:id])
  slim :show
end
