//
//  DailyTableViewController.swift
//  TImeVisualizer
//
//  Created by Hajar Alomari on 17/12/2021.
//

import UIKit
import Charts

var habitList = [Habits]()
let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

class HabitTrackerTableViewController: UITableViewController {
    @IBOutlet weak var todayDateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        fetchAllData()
        
        todayDateLabel.text = getTodayMedium()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewHabitTapped))
    }
    
    @objc func addNewHabitTapped(){
        let alert = UIAlertController(title: "Add New Habit", message: nil, preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: nil)
        
        alert.addAction(UIAlertAction(title: "Add", style: .cancel, handler: {[weak self]_ in
            guard let field = alert.textFields?.first, let text = field.text, !text.isEmpty else {return}
            
            self?.addHabits(name: text)
        }))
        present(alert, animated: true, completion: nil)
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return habitList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! HabitTrackerTableViewCell
        let item = habitList[indexPath.row]
        cell.habitTitleLabel.text = item.name
       
            cell.dateTitle.text =  "Streak: \(item.counter)"
        // this is not ideal I shoudl add generic message.
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = habitList[indexPath.row]
        item.counter += 1
        do{
            try context.save()
            tableView.reloadData()
        }catch{
            print("Failed to increment streak")
        }
        
    }
    

    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, handler) in
            self.deleteHabit(item: habitList[indexPath.row])
            }
            deleteAction.backgroundColor = .red
            let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
            configuration.performsFirstActionWithFullSwipe = false
            return configuration
    }
    
    // do swap right to update ?
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    //MARK: get today
    
    func getTodayMedium() -> String{
        let today = Date()
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        let date = formatter.string(from: today)
        return date
    }
    func getTodayLong(time: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm E, d MMM y"
        let date = formatter.string(from: time)
        return date
    }
    
    //MARK: Core Data
    
    func fetchAllData(){
        do{
             habitList = try context.fetch(Habits.fetchRequest())
            tableView.reloadData()
        }catch{
            print("Failed to fetch data")
            //try making an alert for errors
        }
    }
    
    func addHabits(name: String){
        let newHabit = Habits(context: context)
        newHabit.name = name
        do{
            try context.save()
            fetchAllData()
        }catch{
            print("failed to add new habit")
        }
    }
    
    func deleteHabit(item: Habits){
        context.delete(item)
        do{
            try context.save()
            fetchAllData()
        }catch{
            print("failed to Delete new habit")
        }
    }
    
    //create a func to update the habit and reset the counter
    
    


}



// func to get current date and display it
//when habit is tapped record time and date and disable tap for that habit
// create a timer that will count down unit habit is clickable again == maybe implement it later after testing
//store values and use it to display it in chart
// create a weekly and daily charts

