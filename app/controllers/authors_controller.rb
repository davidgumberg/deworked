class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end

  def show
    @author = Author.find(params: :id)
  end

  def new
    @author = Author.new
  end
end
