import UIKit
class Triangle {
    var name : String;
    var base : Double ;
    var height : Double ;
    
    init(_ name :String, _ base : Double, _ altura : Double ) {
        self.name = name
        self.base = base;
        self.height = altura;
        
        }
    
    func getTriangleAre () -> String {
        
        let area = (base*height)/2;
        
        return "El area del triangulo \(name) es \(area)";
        
    }
    
}

var firstTriangle = Triangle("Isosele", 25, 45)

print(firstTriangle.getTriangleAre())





//Verduleria

func imprimirBoletas(compra:[String: Int]){
    let precioPrducto = ["lechuga":800,"pimenton": 650,"tomate": 990,"papas":1500,"repollo" : 1200]
    var total : Double = 0.0 ;
    for(product, price) in precioPrducto {
            for (vegetable,quantity) in compra
        {
            if vegetable == product {
                total +=  vegetable == "papas" ? Double(price * quantity/20) : Double(price * quantity);
                print("\(vegetable) cantidad \(quantity)")
            }
        }
    }
    
    print("El total a pagar es: \(total)")
    
}

let compra1 = ["tomate": 2, "pimenton":3, "repollo":1, "lechuga":2] ;

//call the function
//imprimirBoletas(compra: compra1 )

//Determinar el area de un circulo

func circle_area(r: Double) -> Double {
    let Pi = 3.14
    let area = Pi * r*r;
    return area;
}

//print(circle_area(r: 25))

func numeroPar(_ number : Int) -> String {
    let module = number % 2;
    if module == 0  {return "El numero \(number) es par" }
    return "El numero \(number) no es par"
}

//call the function

//print(numeroPar(451))

//Determinar temperatura mayor

func mayorTemperature(_ temp1:Double, _ temp2:Double, _ temp3:Double){

    let temperatures = [temp1, temp2, temp3]
    let maxTemperature = temperatures.max()!;
    let minTemperature = temperatures.min()! ;
    
    if maxTemperature == minTemperature {
        print("Las temperaturas son iguales")
        return ;
    }
    print("La temperatura mayor es \(String(describing: maxTemperature))");
    
}

//calling the function
//mayorTemperature(9, 1, 1)

func getRegionWithNumber(_ numero : Int) -> String{
    switch numero {
    case 01:
        return "Tu region es Tarapacá ";
    case 02:
        return "Tu region es Antofagasta "
    case 03:
        return "Tu region es Atacama "
    case 04:
        return "Tu region es Coquimbo "
    case 05:
        return "Tu region es Valporaiso"
    case 06:
        return "Tu region es O'Higgins "
    case 07:
        return "Tu region es El Maule "
    case 08:
        return "Tu region es El Bio Bio "
    case 09:
        return "Tu region es La Araucania "
    case 10:
        return "Tu region es Los Lagos"
        
    default :
        return "No hay region asociada con el numero \(numero)"
    }
}


func getRegionWithKeyWord(_ keyWord : String) -> String{
    switch keyWord.lowercased() {
    case "primera region":
        return "Tu region es Tarapacá ";
    case "segunda region":
        return "Tu region es Antofagasta "
    case "tercera region":
        return "Tu region es Atacama "
    case "cuarta region":
        return "Tu region es Coquimbo "
    case "quinta region":
        return "Tu region es Valporaiso"
    case "sexta region":
        return "Tu region es O'Higgins "
    case "septima region":
        return "Tu region es El Maule "
    case "octava region":
        return "Tu region es El Bio Bio "
    case "novena region":
        return "Tu region es La Araucania "
    case "decima region":
        return "Tu region es Los Lagos"
        
    default :
        return "No hay region asociada con la palabra \(keyWord)"
    }
}


enum regionIdentifier {
    case withNumber(Int)
    case withLetters(String)
}

func tellRegion (_ region : regionIdentifier){
    switch region {
    case .withNumber(let number) :
        print(getRegionWithNumber(number))
    
    case .withLetters(let words):
        print(getRegionWithKeyWord(words))
    }
}
let myRegion = regionIdentifier.withNumber(1)
tellRegion(myRegion);
print("")
let secondRegion = regionIdentifier.withLetters("sexta region");
tellRegion(secondRegion)
