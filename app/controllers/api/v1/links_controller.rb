class Api::V1::LinksController < ApplicationController
  respond_to :json

  def index
    @links = Link.all
    respond_with @links
  end

  def update
    @link = Link.find(params[:id])
    @link.update_read(params[:update])
    @link.save
  end
end
