# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :organization do
    name 'Michigan Science Center'
    city 'Detroit'
    state 'MI'
    postal_code '48202'
    category 'Non-Profit'
  end
end
