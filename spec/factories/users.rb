FactoryGirl.define do
  factory :user, class: "Api::Rest::User" do
    nickname { Faker::Lorem.characters(20) }
  end
end
