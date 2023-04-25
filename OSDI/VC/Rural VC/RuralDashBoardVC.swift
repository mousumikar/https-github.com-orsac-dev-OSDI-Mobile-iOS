//
//  RuralDashBoardVC.swift
//  OSDI
//
//  Created by Mousumi Kar on 20/04/23.
//

import UIKit

class RuralDashBoardVC: UIViewController {
    
    
    
    
    @IBOutlet weak var profileBtn: UIButton!
    @IBOutlet weak var adminName: UILabel!
    
    
    
    @IBOutlet weak var landOwnershipBtn: CustomButton!
    @IBOutlet weak var govtLandBtn: CustomButton!
    @IBOutlet weak var landLeaseBtn: CustomButton!
    @IBOutlet weak var landAcquisitionBtn: CustomButton!
    @IBOutlet weak var afforestationBtn: CustomButton!
    @IBOutlet weak var utilityBtn: CustomButton!
    @IBOutlet weak var farmLandBtn: CustomButton!
    @IBOutlet weak var socialinfraBtn: CustomButton!
    @IBOutlet weak var coalBtn: CustomButton!
    
    
    @IBAction func backBtnToDash(_ sender: Any) {
        performSegue(withIdentifier: "backToRuralUrbanVC", sender: self)
    }
    
    
    @IBAction func profileButton(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

     
    }
    
    
    @IBAction func landOwnershipButton(_ sender: Any) {
        performSegue(withIdentifier: "landOwnershipSegue", sender: self)
    }
    
    
    @IBAction func govtLandInfoButton(_ sender: Any) {
        performSegue(withIdentifier: "govtLandSegue", sender: self)
    }
    
    
    
    @IBAction func landLeaseButton(_ sender: Any) {
        performSegue(withIdentifier: "landLeaseSegue", sender: self)
    }
    
    
    @IBAction func landAcquisitionButton(_ sender: Any) {
        performSegue(withIdentifier: "landAcquisitionSegue", sender: self)
    }
    
   
    @IBAction func afforestationButton(_ sender: Any) {
    }
    
    @IBAction func utilityButton(_ sender: Any) {
        performSegue(withIdentifier: "utilityInfraSegue", sender: self)
    }
    
    
    @IBAction func farmLandButton(_ sender: Any) {
    }
    
    
    @IBAction func socialInfraButton(_ sender: Any) {
        performSegue(withIdentifier: "socialInfraSegua", sender: self)
    }
    
    
    
    @IBAction func coalButton(_ sender: Any) {
        performSegue(withIdentifier: "coalBlockSegue", sender: self)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
}
