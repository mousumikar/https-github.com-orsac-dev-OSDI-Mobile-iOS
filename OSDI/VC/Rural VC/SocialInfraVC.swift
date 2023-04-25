//
//  SocialInfraVC.swift
//  OSDI
//
//  Created by Mousumi Kar on 24/04/23.
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
