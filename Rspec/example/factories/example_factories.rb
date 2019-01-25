FactoryBot.define do
  factory :admin, class: Admin do
    email {Faker::Internet.email}
    title {Faker::Name.name}
    password {"password"}
    password_confirmation {"password"}
    role {rand 0...1}
    role {2}
    store
    apply_type {"normal"}
    apply_value {Faker::Lorem.sentence}
    content {Faker::Lorem.paragraph}
    time_send_value {rand 0...1000}
    appoint {Faker::Boolean.boolean}
    address {Faker::Address.full_address}
    postal_code {Faker::Address.postcode}
    phone {Faker::PhoneNumber.phone_number}
    working_time {Faker::Lorem.sentences}
    comment {Faker::Lorem.sentence(10)}
    monthly_week_off {Faker::Number.between(0, 4)}
    status {"waiting"}
    start_time {DateTime.now}
    end_time {DateTime.now + 30.minutes}
    time {CONSTANT::WORKING_TIME_SERVICE.sample}
  end
end

FactoryBot.define do
  factory :reservation_service, class: ReservationService do
    service
    reservation
  end
end

FactoryBot.define do
  factory :working_time, class: WorkingTime do
    name {Faker::Name.name}
    start_time {DateTime.now}
    end_time {DateTime.now + 300.minutes}
    quantity {rand 10...1000}
    holiday {Faker::Boolean.boolean}
  end
end
