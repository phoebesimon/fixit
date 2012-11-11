class BuildingsController < ApplicationController
  def get_info
    building = Building.find_by_name(params[:name])
    @areas = ["Choose a Location"]
    if(building)
      building.areas.each do |area|
        @areas << area.name
      end
      zone = building.zone
      puts "zone.name is "+ zone.name
      render json: {
        'area_partial' => render_to_string(partial: 'requests/areas', locals: {areas: @areas}),
        'zone_name' => zone.name
      } and return
    end
  end
end
