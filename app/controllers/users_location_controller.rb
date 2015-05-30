class UsersLocationController < ActionController::Base

  def set_my_location
    location_service = UserLocationService.new(params)
    result = location_service.set

    if result.blank?
      render :json => { :message => "Location updated!" }, :status => 200
    else
      render :json => { :message => result.to_s }, :status => 402
    end
  end

  def get_nearby_people
    location_service = UserLocation.new(params)
    user_service = UserService.new({ :user_ids => location_service.get_users_locations })
    render :json => { :payload => user_service.get_users }, :status => 200
  end

end