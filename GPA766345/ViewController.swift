//
//  ViewController.swift
//  GPA766345
//
//  Created by MacStudent on 2019-11-14.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var studDelegate : studentTableViewController?
    
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    
    @IBOutlet weak var studentId: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func SaveAction(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Alert", message: "Are you Sure", preferredStyle: .alert)
        
        let Noaction = UIAlertAction(title: "No", style: .cancel, handler: nil)
        let Yesaction = UIAlertAction(title: "Yes", style: .default){ (action) in
            let AlertController = UIAlertController(title: "New Contact Saved", message:"\(self.firstNameField.text!) is now a New Student", preferredStyle: .alert)
            
            let OkAction = UIAlertAction(title: "OK", style: .default) {
                (action) in
                
                let Fname = self.firstNameField.text
                let Lname = self.lastNameField.text
                let Sid  =  self.studentId.text
                
                let Stud = students(firstName: Fname!, lastName: Lname!, studId: Sid!)
                
                students.StudentsSave.append(Stud)
                
                self.firstNameField.text = ""
                self.lastNameField.text = ""
                self.studentId.text = ""
            }
            
            AlertController.addAction(OkAction)
            self.present(AlertController,animated: true,completion: nil)
            
        }
        
        alert.addAction(Noaction)
        alert.addAction(Yesaction)
        self.present(alert,animated: true,completion: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        studDelegate?.tableView.reloadData()
        
        
        
        
    }
}

