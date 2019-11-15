//
//  studentTableViewController.swift
//  GPA766345
//
//  Created by MacStudent on 2019-11-14.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class studentTableViewController: UITableViewController, UISearchResultsUpdating {
    
    
    
    
    @IBOutlet var SearchBar: UISearchBar!
    let searchContoller  = UISearchController(searchResultsController: nil)
    var filterStud = [students]()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchContoller.searchResultsUpdater = self
        searchContoller.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchContoller.searchBar

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return students.StudentsSave.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       if  let cell = tableView.dequeueReusableCell(withIdentifier: "studentName")
       {
        
        cell.textLabel?.text = "\(students.StudentsSave[indexPath.row].firstName)" + "" + "\(students.StudentsSave[indexPath.row].lastName)"
        
        
        

        // Configure the cell...

        return cell
    }
    return UITableViewCell()
    
}
    
    

    func updateSearchResults(for searchController: UISearchController) {
        SearchedStud(for: searchController.searchBar.text ?? "")
    }
    
    
    
    
    
    
    
    
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let detailsofStudent = segue.destination as? ViewController{
            detailsofStudent.studDelegate = self
        }
    }
    
    func SearchedStud(for searchtext : String){
        
        filterStud = students.StudentsSave.filter({ (students) -> Bool in
            students.firstName.lowercased().contains(searchtext.lowercased())
        })
        
        tableView.reloadData()
    }

}
