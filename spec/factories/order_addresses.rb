FactoryBot.define do
  factory :order_address do
    zip_code                   { '123-4567' }
    prefecture_id              { 27 }
    city                       { '京都市' }
    address                    { '河原町１−１' }
    building_name              { '' }
    phone_number               { '09012345678' }
    token                      { 'tok_abcdefghijk00000000000000000' }
  end
end
