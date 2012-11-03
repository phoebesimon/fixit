class ZonesController < ApplicationController
  def get_buildings
    puts "Get_buildings called with zone " + params[:name]
  end
end
