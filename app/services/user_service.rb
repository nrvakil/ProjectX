class UserService

  def initialize(params = {})
    @params = params
  end

  def authenticate
    if fb_user.present? and fb_user.id == fb_user_id
      user = User.where(:facebook_id => fb_user_id).first
      register if user.blank?
    end
  end

  def register
    user = User.new(create_user_hash)
    user.errors.messages if !user.save
  end

  private

  def auth_token
    params[:auth_token]
  end

  def fb_user_id
    params[:fb_user_id]
  end

  def fb_user
    FbGraph2::User.me(params[:auth_token]).fetch
  end

  def location
    params[:location]
  end

  def hookup_with
    fb_user.interested_in
  end

  def name
    fb_user.name
  end

  def email
    fb_user.email
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
      :video_path    => nil,
      :hookup_with   => hookup_with
    }
  end

end