//
//  ChangePasswordVC.swift
//  OSDI
//
//  Created by Mousumi Kar on 09/04/23.
//

import UIKit

class ChangePasswordVC: UIViewController {
    
    
    
    @IBOutlet weak var viewPswrd: UIView!
    @IBOutlet weak var oldPasswordTxt: UITextField!
    @IBOutlet weak var newPasswordTxt: UITextField!
    @IBOutlet weak var confirmPasswordTxt: UITextField!
    
    @IBAction func backBtn2(_ sender: Any) {
        performSegue(withIdentifier: "backSegue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewPswrd.layer.cornerRadius = 6.0
        
        oldPasswordTxt.layer.cornerRadius = 5.0
        oldPasswordTxt.layer.borderColor = UIColor.black.cgColor
        oldPasswordTxt.layer.borderWidth = 2.0
        
        newPasswordTxt.layer.cornerRadius = 5.0
        newPasswordTxt.layer.borderColor = UIColor.black.cgColor
        newPasswordTxt.layer.borderWidth = 2.0
        
        confirmPasswordTxt.layer.cornerRadius = 5.0
        confirmPasswordTxt.layer.borderColor = UIColor.black.cgColor
        confirmPasswordTxt.layer.borderWidth = 2.0
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
