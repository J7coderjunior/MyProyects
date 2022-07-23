//
//  ViewController.swift
//  FyShopy
//
//  Created by J7CODER on 10-07-22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var Usuario: UITextField!
    @IBOutlet weak var BtnLogin: UIButton!
    @IBOutlet weak var ErrorPassword: UILabel!
    @IBOutlet weak var ErrorUser: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        BtnLogin.layer.cornerRadius = 10
        Usuario.layer.cornerRadius = 8
        Password.layer.cornerRadius = 8
        Usuario.layer.borderWidth = 1
        Password.layer.borderWidth = 1
        Usuario.layer.borderColor = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
        Password.layer.borderColor = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
        ErrorUser.isHidden = true
        ErrorPassword.isHidden = true
        
        BtnLogin.addTarget(self, action: #selector(setUp), for: .touchUpInside)
      
    }
    
    @IBAction func userChange(_ sender: Any) {
        Usuario.layer.borderColor = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
     
    }
    
    @IBAction func passordChange(_ sender: Any) {
        Password.layer.borderColor = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
     
    }
    
    
    func myStyle(_ campo: UITextField, _ label:UILabel){
   
        campo.layer.borderColor = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
        label.isHidden = true
       
    }
    
    
    func formValidate(){
        if ErrorUser.isHidden == true
            && ErrorPassword.isHidden == true
            && Usuario.text == "admin"
            && Password.text == "123" {
            
            let inicio = self.storyboard?.instantiateViewController(withIdentifier: "InicioView") as! InicioView
            inicio.user = Usuario.text!
            self.navigationController?.pushViewController(inicio, animated: true)
        limpiarCampos()
            
            
        }
    }
    
    func limpiarCampos(){
        Usuario.text = ""
        Password.text = ""
    }
    
    func errorStyle(_ campo: UITextField, _ label: UILabel){
       
        campo.layer.borderColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
       label.isHidden = false
    
    }
    
    @objc func setUp(){
        handleUserError(Usuario.text!)
        handlePasswordError(Password.text!)
        formValidate()
    }
    
    //Maneando los errores en el login
    func handleUserError(_ user: String){
        if user == "" {
            ErrorUser.text = "Campo requerido"
            errorStyle(Usuario, ErrorUser)
        }else{
            if user != "admin" {
                ErrorUser.text = "Usuario no registrado"
                errorStyle(Usuario, ErrorUser)
                
            }else{
                myStyle(Usuario,ErrorUser)
            }
        }
        
    }
    
    func handlePasswordError( _ pass: String){
        if pass == "" {
            ErrorPassword.text = "Campo requerido"
            errorStyle(Password, ErrorPassword)
            
        }else{
            if pass != "123"{
                ErrorPassword.text = "Contraseña incorrecta"
                errorStyle(Password, ErrorPassword)
            }else{
                myStyle(Password,ErrorPassword)
            }
        }
      
       
       
    }

}

