FactoryGirl.define do
  
  sequence(:email) { |n| "user#{n}@example.com" }
  
  factory :user do
    email
    password "passwordFG"
    first_name "Factory"
    last_name "Girl"
    admin false
  end
  factory :admin, class: User do
    email
    password "passadmin"
    first_name "Admin"
    last_name "User"
    admin true
  end
end