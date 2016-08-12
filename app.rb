module PivotalTestimony
  class App < Sinatra::Base

    configure :development do
      register Sinatra::Reloader

      use BetterErrors::Middleware
      BetterErrors.application_root = __dir__
    end

    use Rack::Session::EncryptedCookie, secret: ENV["SECRET_KEY"]

    use Routes::Sessions
    use Routes::Stories

  end
end
