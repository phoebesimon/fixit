class ZonesController < ApplicationController
  def get_info
    zone = Zone.find_by_name(params[:name])
    @buildings = ["Choose a Building"]
    @areas = ["Choose a Building First"]
    if(zone)
      zone.buildings.each do |building|
        @buildings << building.name
      end
      render json: {
        'area_partial' => render_to_string(partial: 'requests/areas', locals: {areas: @areas}),
        'building_partial' => render_to_string(partial: 'requests/buildings', locals: {buildings: @buildings})
      } and return
    else
      Building.all.each do |building|
        @buildings << building.name
      end
      render json: {
        'area_partial' => render_to_string(partial: 'requests/areas', locals: {areas: @areas}),
        'building_partial' => render_to_string(partial: 'requests/buildings', locals: {buildings: @buildings})
      } and return
    end
  end
end
