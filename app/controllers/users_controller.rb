class UsersController < ActionController::Base
  before_filter :authenticate_user unless :logged_in?

  def index
    render :json => { :payload => JSON.parse(User.all.to_json) }, :status => 200
  end

  def authenticate_user
    user_service = UserService.new(params)
    result = user_service.authenticate

    if result
      location_service = UserLocationService.new(params.merge!({ :user_id => user_service.get_user.id }))
      location_service.set
      params.merge!({ :user_ids => location_service.get_users_locations })
      render :json => { :payload => user_service.get_users }, :status => 200
    else
      render :json => { :payload => [], :message => "Error in User creation", :errors => result }, :status => 402
    end
  end

  def logged_in?
    @user.present?
  end

end