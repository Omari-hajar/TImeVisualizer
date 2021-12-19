//
//  WeeklyTableViewCell.swift
//  TImeVisualizer
//
//  Created by Hajar Alomari on 18/12/2021.
//

import UIKit

class WeeklyTableViewCell: UITableViewCell {
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var sunLabel: UILabel!
    
    @IBOutlet weak var monLabel: UILabel!
    
    @IBOutlet weak var tueLabel: UILabel!
    @IBOutlet weak var wedLabel: UILabel!
    
    @IBOutlet weak var thuLabel: UILabel!
    @IBOutlet weak var friLabel: UILabel!
    
    @IBOutlet weak var satLabel: UILabel!
    
    
    func settask(task: DailyCalendar){
        //use cases
        if task.day == "Sunday"{
            sunLabel.text = task.title
        }
        if task.day == "Monday" {
            monLabel.text = task.title
        }
        if task.day == "Tuesday" {
            tueLabel.text = task.title
        }
        if task.day == "Wednesday" {
            wedLabel.text = task.title
        }
        if task.day == "Thursday" {
            thuLabel.text = task.title
        }
        if task.day == "Friday" {
            friLabel.text = task.title
        }
        if task.day == "Saturday" {
            satLabel.text = task.title
        }
    }
}
