//
//  LandAcquisitionVC.swift
//  OSDI
//
//  Created by Mousumi Kar on 24/04/23.
//

import UIKit

class LandAcquisitionVC: UIViewController {
    
    var checked = true
    
    @IBOutlet weak var searchView: UIView!
    
    @IBOutlet weak var cancelBtn: CustomButton!
    
    @IBAction func backBtn(_ sender: Any) {
        performSegue(withIdentifier: "landAcquisitionToDashSegue", sender: self)
    }
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        cancelBtn.isHidden = true
        searchView.layer.cornerRadius = 10.0
        searchView.layer.borderColor = UIColor.tintColor.cgColor
        searchView.layer.borderWidth = 1.5
       
    }
    
    @IBAction func searchButton(_ sender: Any) {
        
        if checked{
            searchView.isHidden = false
            checked = false
            
        } else{
            searchView.isHidden = true
            checked = true
        }
    }
    
    @IBAction func filterButton(_ sender: Any) {
        if checked{
            searchView.isHidden = false
            cancelBtn.isHidden = false
            checked = false
        } else{
            searchView.isHidden = true
            cancelBtn.isHidden = true
            checked = true
        }
        
        
    }
    
    
    @IBAction func cancelButton(_ sender: Any) {
        if checked {
            searchView.isHidden = false
            checked = false
            } else {
            searchView.isHidden = true
             checked = true
            }
        
    }
    
    
    
    
    
}
