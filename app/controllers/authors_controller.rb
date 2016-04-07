class AuthorsController < ApplicationController
  def index
  end
  
  def new
    @author = Author.new
    @story  =Story.new
  end
end
