//
//  CostumTask.swift
//  TaskList
//
//  Created by St Verty Vernard on 23-07-22.
//

import UIKit

class CostumTask: UIViewController {
    @IBOutlet var label : UILabel!
    
    @IBOutlet weak var BtnEditar: UIButton!
    @IBOutlet weak var Editar: UITextField!
    var singleTask: String?
    var delete: (()-> Void)?
    var reloadDatas: (()-> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BtnEditar.isHidden = true
        Editar.isHidden = true
        label.text = singleTask
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title:"Eliminar",style:.done, target: self, action: #selector(deleteTarea))
        
        BtnEditar.addTarget(self, action: #selector(EditarTareas), for: .touchUpInside)
    }
    
    @IBAction func EditPencil(_ sender: Any) {
        
        BtnEditar.isHidden = false
        Editar.isHidden = false
        
        Editar.text = singleTask
    }
    
    
    @objc func deleteTarea(){
       delete?()
        
        DispatchQueue.main.async {
            self.navigationController?.popViewController(animated: true)
        }
        
    }
    
    @objc func EditarTareas(){
        let count = UserDefaults().value(forKey: "count") as! Int
        guard let newValue = Editar.text, !newValue.isEmpty else{
            showMessage()
            return
        }
        
        for x in 0..<count {
            let valueToModify = UserDefaults().value(forKey: "tarea_\(x+1)") as? String
            
            if valueToModify == singleTask {
                UserDefaults().set(newValue, forKey: "tarea_\(x+1)")
            }
        }
        
        reloadDatas?()
        
        BtnEditar.isHidden = true
        Editar.isHidden = true
         
         DispatchQueue.main.async {
             self.navigationController?.popViewController(animated: true)
         }
    }
    
    func showMessage(){
        let alert = UIAlertController(title: "Sin tarea", message: "Debes agregar una tarea", preferredStyle:.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alert, animated: true)
    }

}
