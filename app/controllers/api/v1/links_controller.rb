class Api::V1::LinksController < ApplicationController
  respond_to :json

  def index
    if params[:sortType] == "alpha"
      @links = current_user.links.order(title: :asc)
    elsif params[:sortType] == "read"
      @links = current_user.links.where(read: true)
    elsif params[:sortType] == "unread"
      @links = current_user.links.where(read: false)
    else
      @links = Link.all
    end
    respond_with @links
  end

  def update
    @link = Link.find(params[:id])
    @link.update_read(params[:update])
    @link.save
  end
end
