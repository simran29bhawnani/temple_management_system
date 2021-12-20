FactoryBot.define do
  factory :temple do
    temple_name { Faker::Name.name }
    description { Faker::Lorem.sentence }
    temple_email { Faker::Internet.email}
    phone_no { Faker::Number.number(digits: 10) }
    temple_address {}
    city {'Indore'}
    state {'Madhya Pradesh'}
    country {'India'}
    zipcode { Faker:: Number.number(digits: 5)}
    start_time {'10AM'}
    end_time {'11AM'}
    created_at { Date.today }
  end
end

# FactoryBot.define do
#   factory :contact do
#     sequence :name do |n|
#       "John Doe #{n}"
#     end
#     phone { rand(10**9..10**10) }

#     sequence :email do |n|
#       "john-doe#{n}@test.magmalabs.io"
#     end

#     sequence :address do |n|
#       "Fake Address #{n}"
#     end
#   end
# end