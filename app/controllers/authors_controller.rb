class AuthorsController < ApplicationController
  def index
    @authors = Author.includes(:stories).all
  end
  
  def new
    @author = Author.new
    @story  = Story.new
  end
  
  def create
    @author = Author.new(author_params)
    @story = Story.new(story_params)
    auth_valid_flag = @author.valid?
    story_valid_flag = @story.valid?
    
    if auth_valid_flag and story_valid_flag
      @author.save
      @story.author_id = @author.id
      @story.save
      
      redirect_to authors_path
    else
      render 'new'
    end
    
  end
  
  def create_author_ajax
    @author = Author.new(author_params)
    if @author.save
      result_str = "yes"
      result_id = (@author.id).to_s
      result_content = "<option value='#{@author.id}'>#{@author.name}</option>"
    else
      result_str = "no"
      result_id = ""
      result_content = ""
    end
  
    render :json => { result: result_str, result_content: result_content, result_id: result_id }
  end
  
  private
  def author_params
    params.require(:author).permit(:name, :bio, :picture)
  end
  def story_params
    params.require(:story).permit(:title, :content, :picture)
  end
end
