//
//  FilterRouteVC.swift
//  OSDI
//
//  Created by Mousumi Kar on 17/04/23.
//

import UIKit

class FilterRouteVC: UIViewController {
    
    
    @IBOutlet weak var selectWardBtn: UIButton!
    
    
    @IBOutlet weak var selectRouteBtn: UIButton!
    
    @IBAction func btnFromFilToDash(_ sender: Any) {
        performSegue(withIdentifier: "filterSolidToDashSegue", sender: self)
    }
    
    
    @IBAction func searchButton(_ sender: Any) {
        performSegue(withIdentifier: "searchSolidWasteSegue", sender: self)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        selectWardBtn.layer.cornerRadius = 10.0
        selectRouteBtn.layer.cornerRadius = 10.0
        
    }
    
    @IBAction func selectWardButton(_ sender: Any) {
    }
    
    
    @IBAction func selectRouteButton(_ sender: Any) {
    }
    
    
    
    
    

   

}
