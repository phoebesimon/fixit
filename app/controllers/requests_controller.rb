class RequestsController < ApplicationController
  def index

  end
  def search
  end

  def create
    puts params[:request]
    request_hash = params[:request]


    area = Area.find_by_name(request_hash[:area])
    if(area.nil? or area.name.nil? or area.name == '')
      puts "area " + request_hash[:area]
      area = Area.create!(:name=>request_hash[:area])
    else
    end
    @request = Request.create!(:zone => request_hash[:zone], :building => request_hash[:building], :name => request_hash[:name], :phone => request_hash[:phone], :email => request_hash[:email], :description => request_hash[:description], :area => area)
    flash[:notice] = "Request was sent successfully"
    redirect_to request_path(@request.id)
  end

  def show
    id = params[:id]
    @request = Request.find_by_id(id)
    if(@request.nil?)
      flash[:notice] = "There is no request with the specified id: " + id
      redirect_to requests_path
      return
    end
  end

  def search

  end

  def do_search
    redirect_to "/requests/#{params[:search]['request_id']}"
  end

  def new
    @zones = Zone.all.map do |zone|
      zone.name
    end
    @buildings = Building.all.map do |building|
      building.name
    end
    @areas = Area.all.map do |area|
      area.name
    end

  end

end
