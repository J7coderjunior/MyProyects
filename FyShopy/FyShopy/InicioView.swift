import UIKit

class Producto {
    let title: String
    let image : String
    let price : String
    let descripcion: String
    let codigo : String
    
    init(title: String, image : String, price: String, descripcion
            : String, codigo : String) {
        self.title = title
        self.image = image
        self.price = price
        self.descripcion = descripcion
        self.codigo = codigo
    }
    
}

let misProductos = [
    Producto(title: "Zapatilla", image: "znikeairforce", price: "1200",
             descripcion:"Zapatilla nike air force hombre", codigo: "zc-004"),
    Producto(title: "Vaquero", image: "vaquerohombre", price: "1600",
             descripcion:"Vaquero hombre fit jeans", codigo: "jk-0021"),
    Producto(title: "Polera", image: "polera", price: "1700",
             descripcion:"Polera DC hombre manga larga", codigo: "px-0045"),

]
class InicioView: UIViewController, UITableViewDataSource ,UITableViewDelegate{
    
    @IBOutlet weak var Username: UILabel!
    
    @IBOutlet weak var MyTable: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        misProductos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mycell", for: indexPath) as! myTableViewCell
        let model = misProductos[indexPath.row]
        cell.configure(model: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let productSelected = misProductos[indexPath.row]
       passingDatas(productSelected)
    }
    

   
    var user = "";
    override func viewDidLoad() {
        super.viewDidLoad()
        Username.text = "\(user)"
        
        // the tableView
        MyTable.dataSource = self
        MyTable.delegate = self
        MyTable.register(myTableViewCell.self, forCellReuseIdentifier: "mycell")
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Salir", style: .done, target: self, action: #selector(leaveApplication))
    }
    
    func passingDatas(_ data : Producto){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetallesProducto") as! DetallesProducto
        vc.image = data.image
        vc.nombreP = data.title
        vc.precio = data.price
        vc.descripcion = data.descripcion
        vc.codigo = data.codigo
        vc.precioInt = Int(data.price)!
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
  @objc  func leaveApplication(){
    
    let alert = UIAlertController(title: "Salir", message: "¿Seguro quieres salir?", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "cancelar",style: .cancel, handler: nil))
    
    alert.addAction(UIAlertAction(title: "si", style: .default, handler: {_ in
        self.navigationController?.popToRootViewController(animated: true)
    }))
    
    self.present(alert,animated: true)
        
    }

}
