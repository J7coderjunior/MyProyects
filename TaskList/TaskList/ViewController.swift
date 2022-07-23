//
//  ViewController.swift
//  TaskList
//
//  Created by St Verty Vernard on 23-07-22.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var Table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Tareas"
        Table.dataSource = self
        Table.delegate = self
        
        if !UserDefaults().bool(forKey: "setup"){
            
            UserDefaults().set(true, forKey: "setup")
            UserDefaults().set(0, forKey: "count")
            
        }
        
        updateTask()
        
       
    }
    
    var tareas = [String]()
    var currentValue = ""
    
    //The addButon
    @IBAction func AddNewTask(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "TaskManager") as! TaskManagerViewController
        vc.title = "Agregar nueva tarea"
        vc.update = {
            DispatchQueue.main.async {
                self.updateTask()
            }
        }
        navigationController?.pushViewController(vc, animated: true)
        
    }
  
    func updateTask(){
        
        tareas.removeAll()
        //get the number of task that were added
        let count = UserDefaults().value(forKey: "count") as! Int
        
        for x in 0..<count  {
            
            if let tarea = UserDefaults().value(forKey: "tarea_\(x+1)") as? String {
                tareas.append(tarea)
            }
        }
        
        Table.reloadData()
    }
    
    func deleteTask(_ currentValue: String){
        
        let count = UserDefaults().value(forKey: "count") as! Int
     
        for x in 0..<count {
            let selectedValue =  UserDefaults().value(forKey: "tarea_\(x+1)") as? String
            if  selectedValue == self.currentValue {
                UserDefaults().removeObject(forKey: "tarea_\(x+1)")
                
            }
        }
        
        //Reload datas
        updateTask()

    }
    
}

    
    extension ViewController: UITableViewDelegate {
        
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            
            let vc = storyboard?.instantiateViewController(identifier: "CostumTask") as! CostumTask
            vc.title = "Detalle"
            vc.singleTask = tareas[indexPath.row]
            vc.reloadDatas = {
                DispatchQueue.main.async {
                    self.updateTask()
                }
            }
            
            self.currentValue  = self.tareas[indexPath.row]
            
            vc.delete = {
                DispatchQueue.main.async {
                    self.deleteTask(self.currentValue)
                }
            }
            
            navigationController?.pushViewController(vc, animated: true)
        }
        
        
    }


    extension ViewController: UITableViewDataSource{
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return tareas.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = tareas[indexPath.row]
            return cell
        }
        
    }


