FactoryGirl.define  do
  factory :user do |u|
    u.name            { Faker::Name.name }
    u.email           { Faker::Internet.email }
    u.date_of_birth   { Faker::Date.between(30.years.ago, 18.years.ago)  }
    u.gender          { rand(4)                                          }
    u.image_path      { Faker::Avatar.image("test.jpg")                  }
    u.video_path      ""
    u.hookup_with     { rand(4)                                          }
    u.facebook_id     { Faker::Number.number(6)                          }
    u.status          { rand(3)                                          }
    u.created_at      { Faker::Date.between(5.years.ago, 4.years.ago)    }
    u.updated_at      { Faker::Date.between(4.years.ago, 10.minutes.ago) }
  end
end
