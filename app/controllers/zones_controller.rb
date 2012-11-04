class ZonesController < ApplicationController
  def get_buildings
    puts "Get_buildings called with zone " + params[:name]
    @buildings = Zone.find_by_name(params[:name]).buildings.map do |building|
      building.name
    end
    puts "The buildings are #{@buildings}"
    render :partial => 'requests/buildings', :object => @buildings and return
  end
end
