//
//  WeeklyTableViewController.swift
//  TImeVisualizer
//
//  Created by Hajar Alomari on 17/12/2021.
//

import UIKit

var dailyTaskList =  [DailyCalendar]()
let contextDaily = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

class DailyTaskTableViewController: UITableViewController, UIPickerViewDataSource, UIPickerViewDelegate {
   
    

    @IBOutlet weak var datePickerView: UIPickerView!
    
    var dayPickerList = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    var day: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePickerView.delegate = self
        datePickerView.dataSource = self
        fetchAllData()
        
        for i in 0...23 {
            addTime(time: i)
        }
        
    }
    
    //MARK: PickerView
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dayPickerList.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dayPickerList[row]
    }
    
   
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       day = dayPickerList[row]
       
    }

    // MARK: - Table view data source

  

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dailyTaskList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DailyCell", for: indexPath) as! DailyTaskTableViewCell
        
        let item = dailyTaskList[indexPath.row]
        cell.timeLabel.text = item.time
        cell.dailyTaskLabel.text = item.title
        cell.dayLabel.text = item.day
        
        return cell
    }
    

  
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = dailyTaskList[indexPath.row]
        let alert = UIAlertController(title: "ADD Item", message: "Enter new Item", preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: nil)
        
        alert.addAction(UIAlertAction(title: "Submit", style: .cancel, handler: {[weak self]_ in
            guard  let field = alert.textFields?.first, let text = field.text, !text.isEmpty else{
                return
            }
            self?.addTask(item: item, text: text, day: self?.day ?? "Unknown")
           
        }))
        present(alert, animated: true)
        
    }
    
    func fetchAllData(){
        do{
            dailyTaskList = try context.fetch(DailyCalendar.fetchRequest())
            tableView.reloadData()
        }catch{
            print("Failed to fetch data")
        }
    }
    
    func addTime(time: Int){
        let newTask = DailyCalendar(context: contextDaily)
        newTask.time = "\(time):00"
        do{
            try contextDaily.save()
            fetchAllData()
        }catch{
            print("Failed to save data")
        }
    }
    
    func addTask(item: DailyCalendar, text: String, day: String){
        //let newTask = DailyCalendar(context: contextDaily)
        item.title = text
        item.date = Date()
        item.day = day
       
        do{
            try contextDaily.save()
            fetchAllData()
        }catch{
            print("Failed to add data")
        }
        
    }
}

// do a select cell and alert to update the cell
