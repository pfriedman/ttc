# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :organization do
    sequence(:name) { |i| "Org #{i}" }
    city 'Detroit'
    state 'MI'
    postal '48202'
    category 'Non-Profit'
  end
end
