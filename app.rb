class PivotalTestimony < Sinatra::Base

  use Rack::Session::EncryptedCookie, secret: ENV['SECRET_KEY']

  configure :development do
    register Sinatra::Reloader

    use BetterErrors::Middleware
    BetterErrors.application_root = __dir__
  end

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
    @@client ||=
      TrackerApi::Client.new(token: session[:api]) if session[:api].present?
  end

  def projects
    @@projects ||= client.projects
  end

  get "/" do
    @projects = projects if client
    @api_token = session[:api]
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
      session[:api] = params[:api_token]
      @@client = TrackerApi::Client.new(token: session[:api])
    else
      session[:api] = nil
    end
    redirect "/"
  end

  get "/projects/:project_id/stories/:story_id" do
    story = client.project(params[:project_id]).story(params[:story_id])

    @projects = projects
    @api_token = session[:api]
    @feature = Feature.new(story)
    slim :show
  end
end
