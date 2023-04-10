//
//  GrievanceManagementVC.swift
//  OSDI
//
//  Created by Shilpika Mohanty on 10/04/23.
//

import UIKit

class GrievanceManagementVC: UIViewController {
    
    
    @IBOutlet weak var totalGrievanceBtn: CustomButton!
    @IBOutlet weak var pendingBtn: CustomButton!
    @IBOutlet weak var completedBtn: CustomButton!
    @IBOutlet weak var reportedBtn: CustomButton!
    @IBOutlet weak var recheckBtn: CustomButton!
    @IBOutlet weak var assignedBtn: CustomButton!
    
    
    @IBOutlet weak var totalGrivLb: UILabel!
    @IBOutlet weak var pendingLb: UILabel!
    @IBOutlet weak var completedLb: UILabel!
    @IBOutlet weak var reportedLb: UILabel!
    @IBOutlet weak var recheckLb: UILabel!
    @IBOutlet weak var assignedLb: UILabel!
    
    @IBAction func backBtn3(_ sender: Any) {
        performSegue(withIdentifier: "backToDashboardGrievanceSegue", sender: self)
        
    }
    
    @IBAction func totalGrievanceButton(_ sender: Any) {
    }
    
    @IBAction func pendingButton(_ sender: Any) {
    }
    
    
    @IBAction func completedButton(_ sender: Any) {
    }
    
    @IBAction func reportedButton(_ sender: Any) {
    }
    
    @IBAction func recheckButton(_ sender: Any) {
    }
    
    
    @IBAction func assignedBtn(_ sender: Any) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    

}
