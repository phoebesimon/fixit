class RequestsController < ApplicationController
  def index

  end
  def search
  end

  def create
    @request = Request.create!(params[:request])
    flash[:notice] = "Request submitted"
    redirect_to request_path(@request.id)
  end

  def show
    id = params[:id]
    @request = Request.find(id)
  end
end
