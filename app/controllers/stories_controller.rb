class StoriesController < ApplicationController
    def new
        @author = Author.new
        @story = Story.new
        @authors = Author.all
    end
    
    def create
        @story = Story.new(story_params)
        @authors = Author.all
        
        if @story.save
            redirect_to authors_path
        else
            render 'new'
        end
    
    end
    
    private
    def story_params
        params.require(:story).permit(:title, :content, :picture, :author_id)
    end
  
end
