class WikisController < ApplicationController
  def index
    @wikis = Wiki.all
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
  end


  def create
    @wiki = Wiki.new(params.require(:wiki).permit(:title, :body))
    if @wiki.save
      flash[:notice] = "Post was saved."
      redirect_to @wiki
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end

  def update
    @wiki = Wiki.find(params[:id])
    if @wiki.update_attributes(params.require(:wiki).permit(:title, :body))
      flash[:notice] = "Post was updated."
      redirect_to @wiki
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :edit
    end
  end

  def destroy
    @wiki = Wiki.find(params[:id])
    if @wiki.destroy
      flash[:notice] = "Post was deleted."
      redirect_to wikis_path
    else
      flash[:error] = "There was an error deleting the post. Please try again."
      render :show
    end
  end
end
