class RequestsController < ApplicationController
  def index
  end

  def create
    uid = session[:cas_user]
    if uid.nil?
      flash[:warning] = "User has not yet logged in"
      redirect_to "/requests" and return
    end

    user = User.find_by_uid(uid)
    if user.nil?
      user = User.create!(:uid => uid)
    end

    request_hash = params[:request]
    area = Area.find_by_name(request_hash[:area])
    email = request_hash[:email]

    if email =~ /^[a-zA-Z0-9._-]+$/
      email += "@berkeley.edu"
    end

    @request = Request.new(:zone => request_hash[:zone], :building => request_hash[:building], :name => request_hash[:name], :phone => request_hash[:phone], :email => email, :description => request_hash[:description], :area => area, :user => user)

    @request.status = 'pending'
    if @request.save
      # send an email containing the maintenance request information

      email_body = @request.to_list
      subject_text = "[Maintenance Request Submitted] #{@request.name} from #{@request.area}"

      UserMailer.request_created_email(email_body, subject_text).deliver!
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
    uid = session[:cas_user]
    user = User.find_by_uid(uid)
    if user.nil?
      @requests = nil
    else
      @requests = user.requests
    end
    if @requests.nil?
      @requests = []
    end
    @headers = ["Request to See Status", "Location", "Date", "Description"]

  end

  def do_search
    redirect_to "/requests/#{params[:search]['request_id']}"
  end

  def new
    setup_areas
    @request = Request.new

  end

  def setup_areas_again

  end

  def setup_areas
    @zones = ['Choose a Zone']
    Zone.all.each do |zone|
      @zones << zone.name
    end
    @buildings = ['Choose a Building']
    Building.all.each do |building|
      @buildings << building.name
    end
    @areas = ['Choose a Building First']
    Area.all.each do |area|
      @areas << area.name
    end

  end

  def send_status_email
    @request = Request.find_by_id(params[:id])
    email_body = @request.to_list
    subject_text = "[View Maintenance Request Status] #{@request.name} from #{@request.area}"

    UserMailer.request_view_status_email(email_body, subject_text).deliver!
    flash[:notice] = "Your status request was received. You should receive an update email from an RSSP staff member shortly."
    redirect_to '/request/search'
  end

end
