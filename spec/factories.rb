FactoryGirl.define do # Gem to specify admin user charcteristics
  factory :user do
    sequence(:firstname)  { |n| "Person #{n}" }
    sequence(:lastname)   { |n| "Person #{n}" }
    sequence(:username)   { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end
end