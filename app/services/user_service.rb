class UserService

  def initialize(params = {})
    @params = params
  end

  def authenticate
    return false if !validate_params
    if fb_user.present? and fb_user.id == fb_user_id
      @user = User.where(:facebook_id => fb_user_id).first
      register if @user.blank?
      return true
    end
    return false
  end

  def register
    @user = User.new(create_user_hash)
    @user.errors.messages if !@user.save
  end

  def get_user
    @user || User.where(:id => user_id).first
  end

  def get_users
    User.where("id IN (?) AND status = (?)", users, status).collect { |u|
      {
        :id              => u.id,
        :name            => u.name,
        :age             => u.date_of_birth,
        :image_path      => u.image_path,
        :distance        => "",
        :last_sign_in_at => u.last_sign_in_at,
        :my_id           => user_id
      }
    }
  end

  def send_notification (details = {})
    details[:message]
  end

  attr_reader :params, :user
  private

  def users
    params[:user_ids]
  end

  def status
    Status::FRESH
  end

  def user_id
    params[:user_id]
  end

  def auth_token
    params[:auth_token]
  end

  def fb_user_id
    params[:fb_user_id]
  end

  def fb_user
    begin
      session = FbGraph2::User.me(auth_token).fetch
    rescue
      raise StandardError.new(@obj.errors.messages.to_s) if session.blank?
    end
    session
  end

  def location
    params[:location]
  end

  def hookup_with
    HookupStatus.get_index(fb_user.interested_in[0].upcase) || 0
  end

  def name
    fb_user.name
  end

  def email
    fb_user.email || ""
  end

  def date_of_birth
    fb_user.birthday
  end

  def gender
    fb_user.gender
  end

  def image
    fb_user.picture
  end

  def create_user_hash
    {
      :facebook_id   => fb_user_id,
      :name          => name,
      :email         => email,
      :date_of_birth => date_of_birth,
      :gender        => gender,
      :image_path    => image,
      :video_path    => "",
      :hookup_with   => hookup_with
    }
  end

  def validate_params
    auth_token.present? and location.present? and fb_user_id.present?
  end

end