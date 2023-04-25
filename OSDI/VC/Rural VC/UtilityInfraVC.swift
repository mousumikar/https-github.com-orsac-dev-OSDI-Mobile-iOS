//
//  UtilityInfraVC.swift
//  OSDI
//
//  Created by Shilpika Mohanty on 25/04/23.
//

import UIKit

class UtilityInfraVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func backBtn(_ sender: Any) {
        performSegue(withIdentifier: "utilityInfraToDashSegue", sender: self)
    }
    
   
}
