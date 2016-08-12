module PivotalTestimony
  module Routes
    class Base < Sinatra::Application

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
