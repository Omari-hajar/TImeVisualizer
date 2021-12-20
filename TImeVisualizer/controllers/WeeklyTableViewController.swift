//
//  WeeklyTableViewController.swift
//  TImeVisualizer
//
//  Created by Hajar Alomari on 20/12/2021.
//

import UIKit

class WeeklyTableViewController: UITableViewController {
 
    var weekly: [WeeklyTasks] = [WeeklyTasks(day: "Sunday", tasks: ["Workout", "Study Swift"]),
                                 WeeklyTasks(day: "Monday", tasks: ["Clean House", "Study Swift"]),
                                 WeeklyTasks(day: "Tuesday", tasks: ["paint", "Study Swift"]),
                                 WeeklyTasks(day: "Wednesday", tasks: ["Read a novel", "Study Swift"]),
                                 WeeklyTasks(day: "Thursday", tasks: ["Study UI", "Study Swift"]),
                                 WeeklyTasks(day: "Friday", tasks: ["watch a movie", "Study Swift"]),
                                 WeeklyTasks(day: "Saturday", tasks: ["groceries", "Study Swift"])]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(barItemTapped))
    }
    
    @objc func barItemTapped(){
        
        let myDatePicker: UIDatePicker = UIDatePicker()
        myDatePicker.datePickerMode = .time
        myDatePicker.frame = CGRect(x: 0, y: 0, width: 90, height: 30)
        
        
        
        let sheet = UIAlertController(title: "Add Task", message: nil , preferredStyle: .actionSheet)
        
        sheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        // weak self to avoid memory leak
      
        //Sunday Action
        sheet.addAction(UIAlertAction(title: "Sunday", style: .default, handler: {[weak self] _ in
            let alert = UIAlertController(title: "Add Task", message: "Enter new Task", preferredStyle: .alert)
            alert.addTextField(configurationHandler: nil)
            
            alert.view.addSubview(myDatePicker)
            alert.addAction(UIAlertAction(title: "Submit", style: .cancel, handler: {[weak self]_ in
                guard  let field = alert.textFields?.first, let text = field.text, !text.isEmpty else{
                    return
                }
                let formatter = DateFormatter()
                formatter.dateFormat = "HH:MM:SS a"
                let hour = formatter.string(from: myDatePicker.date)
                self?.weekly[0].tasks?.append("\(text) \n Time: \(hour)")
                self?.tableView.reloadData()
               
            }))
            self?.present(alert, animated: true)
        }))
        //Monday Action
        sheet.addAction(UIAlertAction(title: "Monday", style: .default, handler: {[weak self] _ in
            let alert = UIAlertController(title: "Add Task", message: nil, preferredStyle: .alert)
            alert.addTextField(configurationHandler: nil)
            alert.view.addSubview(myDatePicker)
            alert.addAction(UIAlertAction(title: "Submit", style: .cancel, handler: {[weak self]_ in
                guard  let field = alert.textFields?.first, let text = field.text, !text.isEmpty else{
                    return
                }
                
                let formatter = DateFormatter()
                formatter.dateFormat = "HH:MM a"
                let hour = formatter.string(from: myDatePicker.date)
                self?.weekly[1].tasks?.append("\(text) \n Time: \(hour)")
                self?.tableView.reloadData()
               
            }))
            self?.present(alert, animated: true)
        }))
        //Tuesday Action
        sheet.addAction(UIAlertAction(title: "Tuesday", style: .default, handler: {[weak self] _ in
            let alert = UIAlertController(title: "Add Task", message: "Enter new Task", preferredStyle: .alert)
            alert.addTextField(configurationHandler: nil)
            alert.view.addSubview(myDatePicker)
            alert.addAction(UIAlertAction(title: "Submit", style: .cancel, handler: {[weak self]_ in
                guard  let field = alert.textFields?.first, let text = field.text, !text.isEmpty else{
                    return
                }
                
                let formatter = DateFormatter()
                formatter.dateFormat = "HH:MM a"
                let hour = formatter.string(from: myDatePicker.date)
                self?.weekly[2].tasks?.append("\(text) \n Time: \(hour)")
                self?.tableView.reloadData()
               
            }))
            self?.present(alert, animated: true)
        }))
        //Wednesday Action
        sheet.addAction(UIAlertAction(title: "Wednesday", style: .default, handler: {[weak self] _ in
            let alert = UIAlertController(title: "Add Task", message: "Enter new Task", preferredStyle: .alert)
            alert.addTextField(configurationHandler: nil)
            alert.addAction(UIAlertAction(title: "Submit", style: .cancel, handler: {[weak self]_ in
                guard  let field = alert.textFields?.first, let text = field.text, !text.isEmpty else{
                    return
                }
                
                let formatter = DateFormatter()
                formatter.dateFormat = "HH:MM a"
                let hour = formatter.string(from: myDatePicker.date)
                self?.weekly[3].tasks?.append("\(text) \n Time: \(hour)")
                self?.tableView.reloadData()
               
            }))
            self?.present(alert, animated: true)
        }))
        //Thursday Action
        sheet.addAction(UIAlertAction(title: "Thursday", style: .default, handler: {[weak self] _ in
            let alert = UIAlertController(title: "Add Task", message: "Enter new Task", preferredStyle: .alert)
            alert.addTextField(configurationHandler: nil)
            alert.view.addSubview(myDatePicker)
            alert.addAction(UIAlertAction(title: "Submit", style: .cancel, handler: {[weak self]_ in
                guard  let field = alert.textFields?.first, let text = field.text, !text.isEmpty else{
                    return
                }
                
                let formatter = DateFormatter()
                formatter.dateFormat = "HH:MM a"
                let hour = formatter.string(from: myDatePicker.date)
                self?.weekly[4].tasks?.append("\(text) \n Time: \(hour)")
                self?.tableView.reloadData()
               
            }))
            self?.present(alert, animated: true)
        }))
            
            //Friday Action
            sheet.addAction(UIAlertAction(title: "Friday", style: .default, handler: {[weak self] _ in
                let alert = UIAlertController(title: "Add Task", message: "Enter new Task", preferredStyle: .alert)
                alert.addTextField(configurationHandler: nil)
                alert.view.addSubview(myDatePicker)
                alert.addAction(UIAlertAction(title: "Submit", style: .cancel, handler: {[weak self]_ in
                    guard  let field = alert.textFields?.first, let text = field.text, !text.isEmpty else{
                        return
                    }
                    
                    let formatter = DateFormatter()
                    formatter.dateFormat = "HH:MM a"
                    let hour = formatter.string(from: myDatePicker.date)
                    self?.weekly[5].tasks?.append("\(text) \n Time: \(hour)")
                    self?.tableView.reloadData()
                   
                }))
                self?.present(alert, animated: true)
            }))
                
                //Saturday Action
                sheet.addAction(UIAlertAction(title: "Saturday", style: .default, handler: {[weak self] _ in
                    let alert = UIAlertController(title: "Add Task", message: "Enter new Task", preferredStyle: .alert)
                    alert.addTextField(configurationHandler: nil)
                    alert.view.addSubview(myDatePicker)
                    alert.addAction(UIAlertAction(title: "Submit", style: .cancel, handler: {[weak self]_ in
                        guard  let field = alert.textFields?.first, let text = field.text, !text.isEmpty else{
                            return
                        }
                        
                        let formatter = DateFormatter()
                        formatter.dateFormat = "HH:MM a"
                        let hour = formatter.string(from: myDatePicker.date)
                        self?.weekly[6].tasks?.append("\(text) \n Time: \(hour)")
                        self?.tableView.reloadData()
                       
                    }))
                    self?.present(alert, animated: true)
                }))
    

        present(sheet, animated: true)
    }
                                              

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
            case 0: return "Sunday"
            case 1: return "Monday"
            case 2: return "Tuesday"
            case 3: return "Wednesday"
            case 4: return "Thursday"
            case 5: return "Friday"
            case 6: return "Saturday"
            default: return nil
            }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        // Return false if you do not want the specified item to be editable.
        let alert = UIAlertController(title: "ADD Item", message: "Enter new Item", preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: nil)
        
        alert.addAction(UIAlertAction(title: "Submit", style: .cancel, handler: {[weak self]_ in
            guard  let field = alert.textFields?.first, let text = field.text, !text.isEmpty else{
                return
            }
            self?.weekly[indexPath.section].tasks?[indexPath.row]
            tableView.reloadData()
            
           
        }))
        present(alert, animated: true)
        
    }
   
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return weekly.count
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return weekly[section].tasks?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            
        cell.textLabel?.text = weekly[indexPath.section].tasks?[indexPath.row]
        cell.textLabel?.numberOfLines = 2
      

        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            weekly[indexPath.section].tasks?.remove(at: indexPath.row)
            tableView.reloadData()
           
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
