void main(){ 

const pizzaPrices ={ 

'margherita': 5.5, 

'pepperoni': 7.5, 

'vegetable': 6.6, 

}; 

const order =['margherita', 'pepperoni', 'pineapple']; 

double total = 0.0; 

for(var pizza in order){ 

if(pizzaPrices.containsKey(pizza)){ 

total += pizzaPrices[pizza]!; 

} 
else{ 
print("$pizza is not on the menu"); 
} 
} 
if(total > 0) 
{ 
print("Total: \$$total"); 
} 
} 