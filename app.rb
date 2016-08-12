module PivotalTestimony
  class App < Sinatra::Base

    configure :development do
      register Sinatra::Reloader
    end

    use Rack::Session::EncryptedCookie, secret: ENV["SECRET_KEY"]

    use Routes::Sessions
    use Routes::Stories

  end
end
