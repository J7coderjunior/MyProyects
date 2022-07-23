//
//  DetallesProducto.swift
//  FyShopy
//
//  Created by J7CODER on 10-07-22.
//
import UIKit

class DetallesProducto: UIViewController {

    @IBOutlet weak var Stepper: UIStepper!
    @IBOutlet weak var Image: UIImageView!
    
    @IBOutlet weak var BtnComprar: UIButton!
   
    @IBOutlet weak var Codigo: UILabel!
    
    @IBOutlet weak var Cantidad: UILabel!
    @IBOutlet weak var Precio: UILabel!
    @IBOutlet weak var Descripcion: UILabel!
    var nombreP = ""
    var precio = ""
    var image = ""
    var descripcion = ""
    var codigo = ""
    var precioInt = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        BtnComprar.backgroundColor = .white
        BtnComprar.layer.cornerRadius = 20
        BtnComprar.layer.borderWidth = 1
        BtnComprar.layer.borderColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        BtnComprar.setTitleColor(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), for: .normal)
        Precio.textColor = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
        
        Stepper.minimumValue = 1
        Stepper.maximumValue = 10
        
        
        Stepper.addTarget(self, action: #selector(changeStepperValue(_ :)), for: .valueChanged)
        BtnComprar.addTarget(self, action: #selector(mostrarValorTotal), for: .touchUpInside)
        
        setValue()
    }
    
    func setValue(){
        Image.image = UIImage(named: image)
        Precio.text = "$ " + precio
        Descripcion.text = descripcion
        Codigo.text = codigo 
        
    }
    
    @objc func changeStepperValue(_ valor : UIStepper){
        let cantidad = Int(valor.value)
        Cantidad.text = String(cantidad)
    }
    
    @objc func mostrarValorTotal(){
        let info = self.storyboard?.instantiateViewController(identifier: "Infocompra") as! Infocompra
        let cantidad = Int(Cantidad.text!)!
        info.total = precioInt * cantidad
        self.navigationController?.pushViewController(info, animated: true)
    }
    
}
