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
    @email = request_hash[:email]
    email = @email
    @description = request_hash[:description]

    if email =~ /^[a-zA-Z0-9._-]+$/
      email += "@berkeley.edu"
    end

    @request = Request.new(:name => request_hash[:name], :phone => request_hash[:phone], :email => email, :description => request_hash[:description], :area => area, :user => user)

    @request.status = 'pending'
    if @request.save
      # send an email containing the maintenance request information

      email_body = ["#{@request.name} has submitted the following maitenance request:", ""]
      @request.to_list.each do |x|
        email_body << x
      end
      email_body << ""
      email_body << "Please input this into the database and send any correspondance to #{@request.email}. Thank you for your time."
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


  def decodeLocationId(locationId) #returns the corresponding area
        @building_decoder = {
      "U1C"=>"Central 1",
      "CB"=>"Channing Bowditch",
      "CB-GRD"=>"Channing Bowditch Ground",
      "CH"=>"Cheney Hall",
      "CN"=>"Christian Hall",
      "DE"=>"Deutsch Hall",
      "FB"=>"Freeborn Hall",
      "JH"=>"Ida Jackson House",
      "PU"=>"Putnam Hall",
      "SL"=>"Slottman Hall",
      "U1-ALL"=>"Unit 1 All Buildings",
      "U1-GRD"=>"Unit 1 Ground",
      "U2C"=>"Central 2",
      "CU"=>"Cunningham Hall",
      "DA"=>"Davidson Hall",
      "EH"=>"Ehman Hall",
      "GR"=>"Griffiths Hall",
      "TO"=>"Towle Hall",
      "U2-ALL"=>"Unit 2 All Buildings",
      "U2-GRD"=>"Unit 2 Ground",
      "WA"=>"Wada Hall",
      "MC"=>"Martinez Commons",
      "BC-GRD"=>"Beverly Cleary Ground",
      "BC"=>"Beverly Cleary Hall",
      "U3C"=>"Central 3",
      "IS"=>"Ida Sproul Hall",
      "MV-GRD"=>"Manville Ground",
      "MV"=>"Manville Hall",
      "NO"=>"Norton Hall",
      "PR"=>"Priestley Hall",
      "SB"=>"Spens Black Hall",
      "U3-ALL"=>"Unit 3 All Buildings",
      "U3-GRD"=>"Unit 3 Ground",
      "BO-GRD"=>"Bowles Ground",
      "BO"=>"Bowles Hall",
      "FH1"=>"FH Building 1",
      "FH2"=>"FH Building 2",
      "FH3"=>"FH Building 3",
      "FH4"=>"FH Building 4",
      "FH5"=>"FH Building 5",
      "FH6"=>"FH Building 6",
      "FH7"=>"FH Building 7",
      "FH8"=>"FH Building 8",
      "FH9"=>"FH Building 9",
      "FH-ALL"=>"Foothill All Buildings",
      "FH-GRD"=>"Foothill Ground",
      "ST-GRD"=>"Stern Ground",
      "ST"=>"Stern Hall",
      "CK1"=>"CK Building 1",
      "CK2"=>"CK Building 2",
      "CK3"=>"CK Building 3",
      "CK4"=>"CK Building 4",
      "CK6"=>"CK Building 6",
      "CK7"=>"CK Building 7",
      "CK8"=>"CK Building 8",
      "CK9"=>"CK Building 9",
      "CK11"=>"CK Building 11",
      "CK12"=>"CK Building 12",
      "CK13"=>"CK Building 13",
      "CK16"=>"CK Building 16",
      "CK17"=>"CK Building 17",
      "CK18"=>"CK Building 18",
      "CK19"=>"CK Building 19",
      "CK20"=>"CK Building 20",
      "CK-ALL"=>"Clark Kerr Campus All Buildings",
      "CK-GRD"=>"Clark Kerr Ground"}
    if( not locationId.index("-"))
      return nil
    end
    building_code = locationId[0..locationId.rindex("-")-1]
    area_code = locationId[locationId.rindex("-")+1..-1]
    puts building_code
    building = Building.find_by_name(@building_decoder[building_code])

    if(building)
      area = Area.find(:first, :conditions =>
                       ["name LIKE ? AND building_id = ?",
                        "#{area_code}%", building.id])
      return area
    end
    return nil
  end


  def screpe
    @work_order_id = params[:request_id][:request_id]
    page = Nokogiri::HTML(open(generate_work_order_uri(@work_order_id)))
    if(/No information/ =~ page.css('td')[0].text.strip)
      flash[:warning] = "There is no work order with the id: " + @work_order_id + ". Are you sure you formatted the ID correctly? (e.g. HM-654321)"
      redirect_to search_path and return
    end
    @building_name = screpe_helper(page, 9, 1)
    @location_id = screpe_helper(page, 10, 1)
    @request_date = screpe_helper(page, 12, 1)
    @date_closed = screpe_helper(page, 15, 1)
    @requested_action = screpe_helper(page, 19, 1)
    @corrective_action = screpe_helper(page, 20, 1)
    @completed_notice = screpe_helper(page, 22, 0)
    area = decodeLocationId(@location_id)
    puts area
    if(area)
      @location_id = area.name
    end

    if(@completed_notice == "")
      @completed_notice = "Working on it"
    end
  end

  def screpe_helper(page, tr, td)
    table_rows = page.css("tr")
    if(table_rows) #one big null check
      table_row = table_rows[tr]
      if (table_row)
        table_data = table_row.css("td")
        if(table_data)
          table_datum = table_data[td]
          if(table_datum)
            return table_datum.text.strip()
          end
        end
      end
    end
    return ""
  end



  #This can be stubed out in test so that we do not make web requests during tests
  def generate_work_order_uri(id)
    return 'https://maintenance.housing.berkeley.edu/query_wo_results.html?' + id
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
    @email = nil
    @description = nil
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
    email_body = ["#{@request.name} would like to see the status of the following request:", ""]
    @request.to_list.each do |x|
      email_body << x
    end
    email_body << ""
    email_body << "Please send your response to #{@request.email}. Thank you."
    subject_text = "[View Maintenance Request Status] #{@request.name} from #{@request.area}"

    UserMailer.request_view_status_email(email_body, subject_text).deliver!
    flash[:notice] = "Your status request was received. You should receive an update email from an RSSP staff member shortly."
    redirect_to :controller => :requests, :action => :search, :sent_email => id
  end

end
