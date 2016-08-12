module PivotalTestimony
  module Helpers
    include ActionView::Helpers::UrlHelper
    include ActionView::Helpers::FormTagHelper
    include ActionView::Helpers::FormOptionsHelper

    def client
      TrackerApi::Client.new(token: api_token) if api_token.present?
    end

    def api_token
      session[:api]
    end

  end
end
