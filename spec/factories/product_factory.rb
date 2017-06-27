FactoryGirl.define do
  
  sequence(:name) { |n| "Product #{n}" }
  
  factory :product do
    name
  end
  
end