//
//  DateViewController.swift
//  Comp
//
//  Created by Miro Wallin on 13/02/17.

import UIKit

class DateViewController: UIViewController {
    var employee: Employee!
    let dateFormatter = DateFormatter()
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let date = dateFormatter.date(from: self.employee.bdate!) {
            datePicker.date = date
        }
        else {
            let date = "1970-03-03"
            datePicker.date = dateFormatter.date(from: date)!
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.employee.bdate = dateFormatter.string(from: datePicker.date)
    }
}
