FactoryGirl.define do
  factory :user_location do |ul|
    ul.user_id           { Faker::Number.digit   }
    ul.latitude          "18.4"
    ul.longitude         "72.3"
    ul.radius            { rand(6000)              }
  end
end
