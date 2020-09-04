window.addEventListener('load', function(){

//HTMLから値を取得(呼び出すとバリューを持つ)
const Price = document.getElementById("item-price");
const Tax = document.getElementById("add-tax-price");
const Profit = document.getElementById("profit");

//イベント発火
Price.addEventListener("input",function(){
const inputValue = document.getElementById("item-price").value;
Tax.innerHTML = Math.floor(inputValue * 0.1).toLocaleString();
Profit.innerHTML = Math.floor(inputValue * 0.9).toLocaleString();
})
});





