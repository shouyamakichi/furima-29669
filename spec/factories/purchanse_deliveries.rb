FactoryBot.define do
  factory :purchanse_delivery do
    zip                       {'123-4567'}
    purefecture_id            {2}
    city                      {'大阪市'}
    reference                 {'大阪1-1-1'}
    phone_number              {'09012345678'}
    token                     {"tok_kewojd294"}
    association :user
    association :item
  end
end
