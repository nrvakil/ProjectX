class UserLocation < ActiveRecord::Base

  belongs_to :user

  scope :close_to, -> (latitude, longitude, radius) {
    where(%{
      ST_DWithin(
        ST_GeographyFromText(
          'SRID=4326;POINT(' || user_locations.longitude || ' ' || user_locations.latitude || ')'
        ),
        ST_GeographyFromText('SRID=4326;POINT(%f %f)'),
        %d
      )
    } % [longitude, latitude, radius])
  }
end
