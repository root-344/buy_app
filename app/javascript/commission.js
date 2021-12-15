function commission() {
  
  const priceInput = document.getElementById("item-price");
  if (!priceInput){ return false;}
  priceInput.addEventListener('input', () =>{
    const inputValue = priceInput.value;
    console.log(inputValue)
    const addTaxDom = document.getElementById('add-tax-price');
    addTaxDom.innerHTML = (Math.floor(inputValue * 0.1));

    const profitNumber = document.getElementById("profit")
    const value_result = inputValue * 0.1
   
    profitNumber.innerHTML = (Math.floor(inputValue - value_result));
      
  });
};
window.addEventListener('load', commission) 