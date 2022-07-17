import UIKit
// variable with inout modifier, it a variable that can be change inside and outside of a function
func inOutside(a: inout Int, b: Int){
    //changing the value of the variable a
    a = b + a
}

//inicial value of tha variable a is 25
var a = 25;

print("Valor inicial \(a)")
print("")

inOutside(a: &a, b: 25);
//the final value of the variable a
print("Valor cambiado \(a)")

//function without specify the data type

func withOutDataType<any>(_ a: inout any, _  b: inout any){
    let temporal = a;
    a = b;
    b = temporal
}

//valor1 will be coder and valor2 will be junior
var valor1 = "Junior";
var valor2 = "coder";
 withOutDataType(&valor1, &valor2)
//
print("\(valor1)  \(valor2)")


func imprimirBoletas(array:[String: Int]){
    let precioPrducto = ["lechuga":800,"pimenton": 650,"tomate": 990,"papas":1500]
    var total : Double = 0.0 ;
    for(product, price) in array {
            for (vegetable,quantity) in precioPrducto
        {
            if vegetable == product {
                total +=  vegetable == "papas" ? Double(price * quantity/20) : Double(price * quantity);
                print("\(vegetable) cantidad \(quantity)")
            }
        }
    }
    
    print("El total a pagar es: \(total)")
    
}

imprimirBoletas(array:  ["tomate": 2, "pimenton":3, "repollo":1, "lechuga":2])
