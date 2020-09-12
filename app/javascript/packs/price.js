window.addEventListener('turbolinks:load', function(){
  let item_price = document.getElementById("item-price")
    item_price.addEventListener('input', function(){
      price = item_price.value 
      const add_tax_price = document.getElementById("add-tax-price")
        tax_price = add_tax_price
        tax_price.innerHTML = Math.floor(price * 0.1)
      const profit = document.getElementById("profit")
        profit_price = profit
        profit_price.innerHTML = price - tax_price.innerHTML 
  })   
})
// ①入力された値を取得して変数に入れる https://www.sejuku.net/blog/27019 https://master.tech-camp.in/curriculums/4672