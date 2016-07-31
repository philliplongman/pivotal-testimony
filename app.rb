require "sinatra/base"
require "sinatra/reloader"


class PivotalExporter < Sinatra::Base
  register Sinatra::Reloader if development?

  def client
    @@client ||= TrackerApi::Client.new(token: ENV['API_TOKEN'])
  end

  def project
    @@project ||= client.project(ENV['PROJECT'])
  end

  get "/stylesheets/app.css" do
    scss :app
  end

  get "/" do
    @title = project.name
    slim :index
  end

  post "/" do
    if params[:story][:id].empty?
      redirect "/"
    else
      id = params[:story][:id].sub('#', '')
      redirect "/stories/#{id}"
    end
  end

  get "/stories/:id" do
    @title = project.name
    @feature = Feature.new project.story(params[:id])
    slim :show
  end
end
