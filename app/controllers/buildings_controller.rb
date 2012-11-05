class BuildingsController < ApplicationController
  def get_areas
    puts "Get_areas called with building " + params[:name]
    @areas = Building.find_by_name(params[:name]).areas.map do |area|
      area.name
    end
    puts "The areas are #{@areas}"
    render :partial => 'requests/areas', :object => @areas and return
  end
end
