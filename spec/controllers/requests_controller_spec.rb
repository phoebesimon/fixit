require 'spec_helper'

describe RequestsController do
  before :each do
    User.create!(:uid => "fred")
    CASClient::Frameworks::Rails::Filter.fake("fred")
  end

  describe 'new controller action' do
    it 'should make the zones and buildings in the database available to the view' do
      zone_list = [mock('Zone', :name => "zone1"), mock('Zone', :name => "zone2")]
      building_list = [mock('Building', :name => "building1"), mock('Building', :name => "building2")]

      Zone.stub(:all).and_return(zone_list)
      Building.stub(:all).and_return(building_list)
      get :new
      assigns(:zones).should == ['Choose a Zone'] + zone_list.map do |zone|
        zone.name
      end
      assigns(:buildings).should == ['Choose a Building'] + building_list.map do |building|
        building.name
      end

    end
  end

  describe 'do_search' do
    it 'should redirect to the show url' do
      Request.stub(:find_by_id).and_return(mock('Request'))
      get :do_search, {:search=>{:request_id => 1}}
      response.should redirect_to(request_path(1))
    end
  end
  describe 'show controller method' do
    it 'should render the show template for a valid request_id' do
      Request.stub(:find_by_id).and_return(mock('Request'))
      get :show, {:id=>1}
      response.should render_template(:action => "show")
    end
    it 'should render the home page for an invalid request_id' do
      Request.stub(:find_by_id).and_return(nil)
      get :show, {:id =>1}
      response.should render_template(:action => "index")
    end
  end
  describe 'scrape method' do
    it 'should show the work order info for a completed order' do
      controller.stub!(:generate_work_order_uri).and_return('spec/wo.html')
      post :screpe, {:request_id => {:request_id => "test_wo"}}
      assigns(:building_name).should == "Slottman Hall"
      assigns(:location_id).should == "SL-L05"
      assigns(:request_date).should == "06/19/2012"
      assigns(:date_closed).should == "06/22/2012"
      assigns(:requested_action).should == "please re-core lock to 4GM64 key (per conference's request)"
      assigns(:corrective_action).should == "06/20/2012 16:10 John Arthu Cvar -"
      assigns(:completed_notice).should == "Requested action has been completed"
    end
    it 'should show the work order info for a completed order' do
      controller.stub!(:generate_work_order_uri).and_return('spec/wo_not_completed.html')
      post :screpe, {:request_id => {:request_id => "test_wo"}}
      assigns(:building_name).should == "Pat Brown's Grille"
      assigns(:location_id).should == "PB-Bldg"
      assigns(:request_date).should == "11/19/2012"
      assigns(:date_closed).should == ""
      assigns(:requested_action).should == "PM Weekly Inspection On Kitchen Equipment"
      assigns(:corrective_action).should == ""
      assigns(:completed_notice).should == "Working on it"
    end
    it 'should redirect to the search page for a bad work order' do
      controller.stub!(:generate_work_order_uri).and_return('spec/wo_no_information.html')
      post :screpe, {:request_id => {:request_id => "test_wo"}}
      response.should redirect_to(search_path())
    end
  end
end
