class LinksController < ApplicationController
  def index
    if current_user
      @links = current_user.links
    else
      redirect_to login_path
    end
  end

  def create
    @link = Link.new(link_params)
    @link.user_id = current_user.id if current_user
    if @link.save
      flash[:success] = "Link was created."
    else
      flash[:warning] = @link.errors.full_messages.join(", ")
    end
    redirect_to links_path
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    @link.update(link_params)
    if @link.save
      redirect_to links_path
      flash[:success] = "Your link has been edited"
    else
      flash[:warning] = @link.errors.full_messages.join(", ")
      redirect_to edit_link_path(@link)
    end
  end

  private
    def link_params
      params.require(:link).permit(:title, :url)
    end
end
