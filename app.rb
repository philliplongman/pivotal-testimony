require "sinatra/base"
require "sinatra/reloader"
require "action_view"


class PivotalExporter < Sinatra::Base
  register Sinatra::Reloader if development?

  helpers do
    include ActionView::Helpers::UrlHelper
    include ActionView::Helpers::FormTagHelper
    include ActionView::Helpers::FormOptionsHelper
  end

  def client
    @@client ||= TrackerApi::Client.new(token: ENV['API_TOKEN'])
  end

  def projects
    @@projects ||= client.projects
  end

  get "/stylesheets/app.css" do
    scss :app
  end

  get "/" do
    @projects = projects
    slim :index
  end

  post "/" do
    if params[:story_id].empty?
      redirect "/"
    else
      project_id = params[:project_id]
      story_id = params[:story_id].sub('#', '')
      redirect "/projects/#{project_id}/stories/#{story_id}"
    end
  end

  get "/projects/:project_id/stories/:story_id" do
    story = client.project(params[:project_id]).story(params[:story_id])

    @projects = projects
    @feature = Feature.new(story)
    slim :show
  end
end
