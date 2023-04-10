//
//  MyProfileVC.swift
//  OSDI
//
//  Created by Mousumi Kar on 09/04/23.
//

import UIKit

class MyProfileVC: UIViewController {
    
    
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var nameTxtField: UITextField!
    @IBOutlet weak var lbDepartment: UILabel!
    @IBOutlet weak var departmentTxtView: UITextView!
    @IBOutlet weak var lbDesignation: UILabel!
    @IBOutlet weak var designationTXtfield: UITextField!
    @IBOutlet weak var lbEmail: UILabel!
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var lbMobile: UILabel!
    @IBOutlet weak var mobileTxtField: UITextField!
    @IBOutlet weak var lbUsername: UILabel!
    @IBOutlet weak var userNameTxtField: UITextField!
    @IBAction func backBtnToDashboard(_ sender: Any) {
        performSegue(withIdentifier: "BackToDashSegue", sender: self)
    }
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        departmentTxtView.layer.cornerRadius = 5.0
        departmentTxtView.layer.borderColor = UIColor.black.cgColor
        departmentTxtView.layer.borderWidth = 1.0
        nameTxtField.layer.cornerRadius = 5.0
        nameTxtField.layer.borderColor = UIColor.black.cgColor
        nameTxtField.layer.borderWidth = 1.0
        designationTXtfield.layer.cornerRadius = 5.0
        designationTXtfield.layer.borderColor = UIColor.black.cgColor
        designationTXtfield.layer.borderWidth = 1.0
        emailTxtField.layer.cornerRadius = 5.0
        emailTxtField.layer.borderColor = UIColor.black.cgColor
        emailTxtField.layer.borderWidth = 1.0
        mobileTxtField.layer.cornerRadius = 5.0
        mobileTxtField.layer.borderColor = UIColor.black.cgColor
        mobileTxtField.layer.borderWidth = 1.0
        userNameTxtField.layer.cornerRadius = 5.0
        userNameTxtField.layer.borderColor = UIColor.black.cgColor
        userNameTxtField.layer.borderWidth = 1.0
        
        

       
    }
    

   

}
