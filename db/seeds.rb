# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


if User.count == 0
  users = FactoryGirl.create_list(:user, 1000)
  users.each do |user|
    FactoryGirl.create(:user_location, :user_id => user.id)
  end
end
