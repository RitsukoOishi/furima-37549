FactoryBot.define do
  factory :record_delivery do
    token {"tok_abcdefghijk00000000000000000"}
    post_code       { '123-4567' }
    prefecture_id   { 2 }
    city            { '東京都' }
    house           { '葛飾区1-1' }
    building_number { '東京ハイツ' }
    phone           { '09012345678' }

  end
end
