class UsersController < ActionController::Base
  before_filter :authenticate_user unless :logged_in?

  def index
    users = User.all.collect { |u|
      {
        :id              => u.id,
        :name            => u.name,
        :age             => u.date_of_birth,
        :image_path      => u.image_path,
        :distance        => "",
        :last_sign_in_at => u.last_sign_in_at,
        :my_id           => 2014
      }
    }
    render :json => { :payload => users }, :status => 200
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
