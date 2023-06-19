class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end

  def show
    @author = Author.find(params[:id])
  end

  def search
    @authors = Author.containing(params[:query])
  end

  def new
    @author = Author.new
  end

  private

    def set_author
      @author = Work.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def author_params
      params.require(:author).permit(:name, :birth, :death)
    end
end
