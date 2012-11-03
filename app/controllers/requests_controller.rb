class RequestsController < ApplicationController
  def index
  end

  def search
  end

  def create
    request_hash = params[:request]
    area = Area.find_by_name(request_hash[:area])

    @request = Request.new(:zone => request_hash[:zone], :building => request_hash[:building], :name => request_hash[:name], :phone => request_hash[:phone], :email => request_hash[:email], :description => request_hash[:description], :area => area)
    @request.status = 'pending'
    if @request.save
      # send an email containing the maintenance request information
      gmail_username = "ucbfixit@gmail.com" #ENV['GMAIL_USERNAME']
      gmail_password = "ertcwERDSFgDOadf125423" #ENV['GMAIL_PASSWORD']
      destination_address = "christopher.j.turney@gmail.com" #ENV['GMAIL_DEST']

      email_body = @request.to_s
      subject_text = "[Maintenance Request Submitted] #{@request.name} from #{@request.area}"

      Gmail.connect!(gmail_username, gmail_password) do |gmail|
        gmail.deliver! do
          to destination_address
          subject subject_text
          body email_body
        end
      end

      flash[:notice] = "Request submitted"
      redirect_to request_path(@request.id)
    else
      setup_areas
      render 'new'
    end

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
    setup_areas
    @request = Request.new

  end

  def setup_areas
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
