class UserLocationService

  def initialize (params = {})
    @params = params
  end

  def set
    locaiton = UserLocation.new(create_location_hash)
    location.errors.messages if !locaiton.save
  end

  def get
    UserLocation.where(:user_id => user_id).first
  end

  def get_users_locations
    location = get
    location.present? ? UserLocation.where('user_id NOT IN (?)', [location.user_id]).close_to(location.latitude, location.longitude, location.radius).pluck(:user_id) : []
  end

  attr_reader :params
  private

  def user_id
    params[:user_id]
  end

  def latitude
    params[:latitude].to_f
  end

  def longitude
    params[:longitude].to_f
  end

  def radius
    params[:radius].to_f
  end

  def create_location_hash
    {
      :user_id    => user_id,
      :latitude  => latitude,
      :longitude => longitude,
      :radius    => radius
    }
  end
end