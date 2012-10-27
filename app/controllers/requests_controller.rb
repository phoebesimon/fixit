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
      # send an email
      #gmail = Gmail.connect(ENV['GMAIL_SMTP_USER'], ENV['GMAIL_SMTP_PASSWORD'])
      logger.info @request.name
      gmail = Gmail.connect!("ucbfixit@gmail.com", "ertcwERDSFgDOadf125423")


      gmail.deliver! do
        to "phoebesimon@hotmail.com"
        subject "[Maintenance Request Submitted]"
        text_part do
          body "stuff"
        end
      end

=begin
      gmail.deliver! do
        to "phoebesimon@hotmail.com"
        subject "[Maintenance Request Submitted] #{@request.name} from #{@request.area} "
        text_part do
          body @request.to_s
        end
      end
=end
      gmail.logout

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
