window.addEventListener('load', function(){
  const itemPrice = document.getElementById("item-price")
  const addTaxPrice = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")

    itemPrice.addEventListener('input',function(){
      const itemPriceVal = document.getElementById("item-price").value;

      addTaxPrice.innerHTML =  Math.floor(itemPriceVal * 10 / 100);
      profit.innerHTML = itemPriceVal - Math.floor(itemPriceVal * 10 / 100);

  })
})


