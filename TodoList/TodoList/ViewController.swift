//
//  ViewController.swift
//  TodoList
//
//  Created by J7CODER on 13-07-22.
//

import UIKit

class ViewController: UIViewController ,UITableViewDataSource{

    
    private let table: UITableView  =  {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set the UserDefault data to the array
        tareas = UserDefaults.standard.stringArray(forKey: "tareas") ?? []
        
        view.addSubview(table)
        title = "Todo List"
        table.dataSource = self
        
        //Adding right barButonItem
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self, action: #selector(addTodo))
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        table.frame = view.bounds
    }
    //array to keep the items
    var tareas = [String]()
    
    @objc func addTodo(){
        let alert = UIAlertController(title: "Nuevo tarea", message: "Agregar tu nueva tarea", preferredStyle: .alert)
        alert.addTextField {
            field in
            field.placeholder = "Agregar la tarea..."
        }
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Agregar", style: .default, handler: {[weak self](_) in
            if let campo = alert.textFields?.first {
                
                if let text = campo.text, !text.isEmpty{
                    
                    DispatchQueue.main.async {
                        var oldDatas = UserDefaults.standard.stringArray(forKey: "tareas") ?? []
                        oldDatas.append(text)
                        UserDefaults.standard.setValue(oldDatas, forKey: "tareas")
                        self?.tareas.append(text)
                        self?.table.reloadData()
                    }
                    
                }
            }
        }))
        
        present(alert, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tareas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
        cell.textLabel?.text = tareas[indexPath.row]
        return cell
    }


}

