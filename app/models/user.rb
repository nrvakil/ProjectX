class User < ActiveRecord::Base
  has_one :user_location

  def to_user_hash
    {
       id: self.id,
       email: self.email,
       name: self.name,
       date_of_birth: self.date_of_birth,
       gender: self.gender,
       image_path: self.image_path,
       video_path: self.video_path,
       sign_in_count: self.sign_in_count,
       current_sign_in_at: self.current_sign_in_at,
       last_sign_in_at: self.last_sign_in_at,
       hookup_with: self.hookup_with,
       facebook_id: self.facebook_id,
       status: self.status,
       created_at: self.created_at.to_s,
       updated_at: self.updated_at.to_s,

       location: {
          latitude: self.user_location.latitude.to_s,
          longitude: self.user_location.longitude.to_s,
          radius: self.user_location.radius,
       }
    }
  end
end
