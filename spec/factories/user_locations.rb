FactoryGirl.define do
  factory :user_location do |ul|
    ul.user_id           { Faker::Number.digit   }
    ul.latitude          { rand(100)              }
    ul.longitude         { rand(100)              }
    ul.radius            { rand(6000)              }
  end
end
