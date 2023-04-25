//
//  FilterMapHeritageVC.swift
//  OSDI
//
//  Created by Mousumi Kar on 17/04/23.
//

import UIKit

class FilterMapHeritageVC: UIViewController {
    
 
    @IBOutlet weak var selectVillageBtn: UIButton!
    @IBOutlet weak var plotNoTxtFld: UITextField!
    @IBAction func backToHeriMap(_ sender: Any) {
        performSegue(withIdentifier: "filterVillagetoMapSegue", sender: self)
    }
    
    @IBOutlet weak var searchBtn: CustomButton!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        plotNoTxtFld.layer.cornerRadius = 6.0
        plotNoTxtFld.layer.borderWidth = 1.0
        plotNoTxtFld.layer.borderColor = UIColor.tintColor.cgColor
        
        selectVillageBtn.layer.cornerRadius = 6.0
        selectVillageBtn.layer.borderWidth = 1.0
        selectVillageBtn.layer.borderColor = UIColor.tintColor.cgColor

       
    }
    

    
    @IBAction func searchButton(_ sender: Any) {
    }
    
}
