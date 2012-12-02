require 'open-uri'

class RequestsController < ApplicationController
  def index
  end

  def create
    uid = session[:cas_user]

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

    @request = Request.new(:name => request_hash[:name], :phone => request_hash[:phone], :email => email, :description => request_hash[:description], :area => area, :user => user)

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

  def screpe
    @work_order_id = params[:request_id][:request_id]
    page = Nokogiri::HTML(open('https://maintenance.housing.berkeley.edu/query_wo_results.html?' + @work_order_id))
    if(/No information/ =~ page.css('td')[0].text.strip)
      flash[:warning] = "There is no work order with the id: " + @work_order_id + ". Are you sure you formatted the number correctly? (e.g. HM-654321)"
      redirect_to '/request/search/' and return
    end
    @building_name = screpe_helper(page, 9, 1)
    @location_id = screpe_helper(page, 10, 1)
    @request_date = screpe_helper(page, 12, 1)
    @date_closed = screpe_helper(page, 15, 1)
    @requested_action = screpe_helper(page, 19, 1)
    @corrective_action = screpe_helper(page, 20, 1)
    @completed_notice = screpe_helper(page, 22, 0)
    if(@completed_notice == "")
      @completed_notice = "Not Done"
    end
  end

  def screpe_helper(page, tr, td)
    return page.css("tr")[tr].css("td")[td].text.strip()
  end

  def search
    @sent_email = params[:sent_email]
    uid = session[:cas_user]
    user = User.find_by_uid(uid)
    @requests = nil
    @requests = user.requests unless user.nil?
    @requests = [] if @requests.nil?
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
    id = params[:id]
    @request = Request.find_by_id(id)
    email_body = @request.to_list
    subject_text = "[View Maintenance Request Status] #{@request.name} from #{@request.area}"

    UserMailer.request_view_status_email(email_body, subject_text).deliver!
    flash[:notice] = "Your status request was received. You should receive an update email from an RSSP staff member shortly."
    redirect_to :controller => :requests, :action => :search, :sent_email => id
  end

end
