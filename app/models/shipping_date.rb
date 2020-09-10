class ShippingDate < ActiveHash::Base
  self.data = [
    {id: 1, name: '---'},
    {id: 2, name: '１〜２日で配送'},
    {id: 3, name: '３〜４日で配送'},
    {id: 4, name: '４〜７日で配送'}
  ]
end
