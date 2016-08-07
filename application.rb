class PivotalExporter < Sinatra::Base
  register Sinatra::Reloader if development?

  configure do
    register Sinatra::AssetPipeline

    if defined?(RailsAssets)
      RailsAssets.load_paths.each { |path| settings.sprockets.append_path(path) }
    end
  end

  helpers do
    include ActionView::Helpers::UrlHelper
    include ActionView::Helpers::FormTagHelper
    include ActionView::Helpers::FormOptionsHelper
  end

  def client
    @@client ||= TrackerApi::Client.new(token: ENV["API_TOKEN"])
  end

  def projects
    @@projects ||= client.projects
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
