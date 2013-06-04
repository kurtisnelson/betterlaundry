# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :machine do
    room_id nil
    number 1
    remaining 40
    status "Starte"
  end
end
