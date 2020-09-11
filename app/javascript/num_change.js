window.addEventListener('load', function () {
  const item_price = document.getElementById("item-price");
  const add_tax_price = document.getElementById('add-tax-price');
  const profit = document.getElementById('profit');  
  item_price.addEventListener('change', function() {
    add_tax_price.textContent = item_price.value * 0.1;
    profit.textContent = parseInt(item_price.value) + parseInt(add_tax_price.textContent);
  });
});