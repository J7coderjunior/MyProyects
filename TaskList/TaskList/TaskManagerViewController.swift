//
//  TaskManagerViewController.swift
//  TaskList
//
//  Created by St Verty Vernard on 23-07-22.
//

import UIKit

class TaskManagerViewController: UIViewController,UITextFieldDelegate {

    var update: (()-> Void)?
    
    @IBOutlet weak var TextInput: UITextField!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()

       TextInput.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Guardar", style: .done, target: self, action: #selector(saveTask))
    }
    


  
    @objc func saveTask(){
        
        guard let text = TextInput.text, !text.isEmpty else{
            showMessage()
            return
        }
        
        let count = UserDefaults().value(forKey: "count") as! Int
        
        let newCount = count + 1
        UserDefaults().set(newCount, forKey: "count")
        
      
        UserDefaults().set(text, forKey: "tarea_\(newCount)")
        
        update?()
        navigationController?.popViewController(animated: true)
    }
    
    func showMessage(){
        let alert = UIAlertController(title: "Sin tarea", message: "Debes agregar una tarea", preferredStyle:.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alert, animated: true)
    }

}
