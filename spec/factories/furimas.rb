FactoryBot.define do
  factory :furima do
    title         {Faker::Lorem.characters(number: 40)}
    content       {Faker::Lorem.characters(number: 50)}
    genre_id      {Faker::Number.between(from: 2, to: 11)}
    condition_id  {Faker::Number.between(from: 2, to: 6)}
    fee_id        {Faker::Number.between(from: 2, to: 3)}
    prefecture_id {Faker::Number.between(from: 2, to: 48)}
    days_num_id   {Faker::Number.between(from: 2, to: 4)}
    price         {Faker::Number.between(from: 300, to: 9999999)}
    
    after(:build) do |furima|
      furima.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    association :user
  end
end
