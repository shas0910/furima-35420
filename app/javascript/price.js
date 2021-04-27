function price (){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("keyup", () => {
    const priceVal = priceInput.value;
    const priceFee = Math.floor(priceVal * 0.1);
    const priceProfit = priceVal - priceFee;
    const fee = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    fee.innerHTML = `${priceFee}`;
    profit.innerHTML = `${priceProfit}`;
  });
}

window.addEventListener('load', price);