module PivotalTestimony
  module Routes
    class Stories < Base

      post "/" do
        if params[:story_id].present?
          project_id = params[:project_id]
          story_id = params[:story_id].sub("#", "")
          redirect "/projects/#{project_id}/stories/#{story_id}"
        else
          redirect "/"
        end
      end

      get "/projects/:project_id/stories/:story_id" do
        @projects = client.projects

        story = client.project(params[:project_id]).story(params[:story_id])
        @feature = Feature.new(story)

        slim :show
      end

    end
  end
end
