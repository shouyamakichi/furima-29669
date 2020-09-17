FactoryBot.define do
  factory :item do
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    
    name                    { '写真' } 
    acount                  {'写真が映る'}
    state_id                {2}
    postage_id              {2}
    region_id               {2}
    shipping_date_id        {2}
    price                   {400}
    category_id             {2}
    association :user
  end
end
