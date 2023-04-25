//
//  SocialInfraVC.swift
//  OSDI
//
//  Created by Shilpika Mohanty on 24/04/23.
//

import UIKit

class SocialInfraVC: UIViewController {
    
    
    
    @IBAction func backBtn(_ sender: Any) {
        performSegue(withIdentifier: "socialToDashSegue", sender: self)
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    

    

}
