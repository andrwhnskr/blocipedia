class WikisController < ApplicationController


  def index
    @wikis = policy_scope(Wiki)
      authorize @wikis
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
      authorize @wiki
  end


  def create
    @wiki = Wiki.new(params.require(:wiki).permit(:title, :body))
    # will create a wiki belonging to the user(entry in user_wikis table automatically done)
    # current_user.wikis.create 

    # will add another conntected user (collaborator) to a current wiki (user_wikis table automatically updated)
    # Wiki.first.users << new_user_to_add

    # removing
    # Wiki.first.users.delete user_to_delete

      authorize @wiki
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
      authorize @wiki
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
