module PivotalTestimony
  module Routes
    class Base < Sinatra::Application
      include Models

      configure :development do
        use BetterErrors::Middleware
        BetterErrors.application_root = __dir__
      end

      configure do
        register Sinatra::AssetPipeline

        if defined?(RailsAssets)
          RailsAssets.load_paths.each { |path| settings.sprockets.append_path(path) }
        end
      end

      helpers Helpers

    end
  end
end
