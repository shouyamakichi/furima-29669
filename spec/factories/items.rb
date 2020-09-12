FactoryBot.define do
  factory :item do
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    
    name                    { '写真' } 
    acount                  {'写真が映る'}
    state_id                {1}
    postage_id              {1}
    region_id               {1}
    shipping_date_id        {1}
    price                   {400}
    category_id             {1}
    association :user
  end
end
