class UsersController < ActionController::Base

  def index
    
  end

  def authenticate_user
    user_service = UserService.new(params)
    result = user_service.authenticate
    if result == true
      render :json => { :payload => [], :message => "Successfully Created a User" }, :status => 200
    else
      render :json => { :payload => [], :message => "Error in User creation", :errors => result }, :status => 402
    end
  end

end