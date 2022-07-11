function count (){
  const price  = document.getElementById("item-price");
  price.addEventListener("keyup", () => {
    
    const price_num = price.value
    const commission =Number(price_num) * 0.1;
    const profit_num = Number(price_num) - commission
    const commission_display  = document.getElementById("add-tax-price");
    commission_display.innerHTML = `${commission}`;

    const profit_display = document.getElementById("profit");
    profit_display.innerHTML = `${profit_num}`;
  });
};

window.addEventListener('load', count);
