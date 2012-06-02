FactoryGirl.define do
  factory :user do
    name     "Charlie Gleason"
    email    "hi@charliegleason.com"
    password "charlie"
    password_confirmation "charlie"
  end
end