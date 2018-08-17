//
//  DepartmentsViewControllerTableViewController.swift
//  Comp
//
//  Created by Miro Wallin on 20/02/17.

import UIKit

class DepartmentsViewControllerTableViewController: UITableViewController {
    var departments: [Department] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func loadData() -> Void {
        Department.getDepartments {(departments) in
        self.departments = departments
        print("dep: ")
        print(self.departments)
        
            DispatchQueue.main.async(execute: {
                print("dep: ")
                print(self.departments.count)
                self.tableView.reloadData()
            })
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return departments.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DepartmentCell", for: indexPath) as! DepartmentCell
        let department = departments[indexPath.row] as Department
        cell.department = department       

        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let emp = self.departments[indexPath.row]
            Department.deleteDepartment(emp: emp, postCompleted: { (succeeded, msg) -> () in print ("delete dep " + msg)
                if succeeded{
                    self.departments.remove(at: indexPath.row)
                }
                DispatchQueue.main.async(execute: {
                    if(succeeded) {
                        self.tableView.deleteRows(at: [indexPath], with: .fade)
                    }
                })
            })
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
