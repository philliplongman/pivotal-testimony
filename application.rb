class PivotalExporter < Sinatra::Base
  register Sinatra::Reloader if development?

  configure :development do
    use BetterErrors::Middleware
    BetterErrors.application_root = __dir__
  end

  configure do
    register Sinatra::AssetPipeline

    if defined?(RailsAssets)
      RailsAssets.load_paths.each do |path|
        settings.sprockets.append_path(path)
      end
    end
  end

  helpers Sinatra::Cookies
  helpers do
    include ActionView::Helpers::UrlHelper
    include ActionView::Helpers::FormTagHelper
    include ActionView::Helpers::FormOptionsHelper
  end

  def client
    @@client ||= TrackerApi::Client.new(token: cookies[:api]) if cookies[:api].present?
  end

  def projects
    @@projects ||= client.projects
  end

  get "/" do
    @projects = projects if client
    @api_token = cookies[:api]
    slim :index
  end

  post "/" do
    if params[:story_id].present?
      project_id = params[:project_id]
      story_id = params[:story_id].sub('#', '')
      redirect "/projects/#{project_id}/stories/#{story_id}"
    else
      redirect "/"
    end
  end

  post "/set-api" do
    if params[:api_token].present?
      cookies[:api] = params[:api_token]
      @@client = TrackerApi::Client.new(token: cookies[:api])
    else
      cookies[:api] = nil
    end
    redirect "/"
  end

  get "/projects/:project_id/stories/:story_id" do
    story = client.project(params[:project_id]).story(params[:story_id])

    @projects = projects
    @api_token = cookies[:api]
    @feature = Feature.new(story)
    slim :show
  end
end
