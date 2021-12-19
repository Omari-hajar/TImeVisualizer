//
//  StatViewController.swift
//  TImeVisualizer
//
//  Created by Hajar Alomari on 17/12/2021.
//

import UIKit
import Charts

class StatViewController: UIViewController, ChartViewDelegate {
    
    let dailyPieChart = PieChartView()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        dailyPieChart.delegate = self
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        dailyPieChart.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height:  self.view.frame.size.width)
        
        dailyPieChart.center = view.center
        view.addSubview(dailyPieChart)
        
        var entries = [PieChartDataEntry]()
        
        for i in habitList {
           // entries.append(ChartDataEntry(x: Double(i.counter), y: Double(i.counter)))
            entries.append(PieChartDataEntry(value: Double(i.counter), label: i.name, data: i as AnyObject))
        }
      
        let set = PieChartDataSet(entries: entries)
      
        set.colors = ChartColorTemplates.material()
        let data = PieChartData(dataSet: set)
        dailyPieChart.data = data
        
    }

}
