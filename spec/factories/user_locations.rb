FactoryGirl.define do
  factory :user_location do |ul|
    ul.user_id           { Faker::Number.digit   }
    ul.latitude          "19.0"
    ul.longitude         "72.0"
    ul.radius            { rand(6000)              }
  end
end
