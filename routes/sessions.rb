module PivotalTestimony
  module Routes
    class Sessions < Base


      get "/" do
        @projects = client.projects if client
        slim :index
      end

      post "/set-api" do
        update_client params[:api_token]
        redirect "/"
      end

      private

      def update_client(token)
        session[:api] = token.present? ? token : nil
      end

    end
  end
end
