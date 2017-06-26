FactoryGirl.define do
  factory :user do
    email "factory@girlrspec.com"
    password "passwordFG"
    first_name "Factory"
    last_name "Girl"
    admin false
  end
end