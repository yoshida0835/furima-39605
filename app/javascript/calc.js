function tax (){
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {
    const taxPrice = Math.floor(itemPrice.value * 0.1);
    const addTaxPrice = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML = `${taxPrice}`;
    const salesProfit = Math.floor(itemPrice.value - taxPrice);
    const profitPrice = document.getElementById("profit");
    profitPrice.innerHTML = `${salesProfit}`;
  });
};

window.addEventListener('turbo:load', tax);