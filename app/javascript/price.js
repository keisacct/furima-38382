const valueTax = 0.1;

function price (){
    let itemPrice = document.getElementById("item-price");
    let taxPrice = document.getElementById("add-tax-price");
    let profit = document.getElementById("profit")
    itemPrice.addEventListener('change', () => {
        valueTaxPrice = itemPrice.value * valueTax;
        valueProfit = itemPrice.value - valueTaxPrice;
        taxPrice.textContent = valueTaxPrice;
        profit.textContent = valueProfit;
    });
};

window.addEventListener('DOMContentLoaded', price);