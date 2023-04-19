//
//  FilterRouteVC.swift
//  OSDI
//
//  Created by Mousumi Kar on 17/04/23.
//

import UIKit

class FilterRouteVC: UIViewController {
    
    
    
    @IBAction func btnFromFilToDash(_ sender: Any) {
        performSegue(withIdentifier: "filterSolidToDashSegue", sender: self)
    }
    
    
    @IBAction func searchButton(_ sender: Any) {
        performSegue(withIdentifier: "searchSolidWasteSegue", sender: self)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

   

}
