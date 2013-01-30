# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :check_footprint do
    created_at "2013-01-28"
    updated_at "2013-01-28"
    phase "MyString"
    parent_id 1
    parent_type "MyString"
  end
end
