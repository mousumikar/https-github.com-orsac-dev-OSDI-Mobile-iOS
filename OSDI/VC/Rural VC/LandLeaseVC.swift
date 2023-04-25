//
//  LandLeaseVC.swift
//  OSDI
//
//  Created by Mousumi Kar on 24/04/23.
//

import UIKit

class LandLeaseVC: UIViewController {

    var checked = true
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var distrcitBtn: CustomButton!
    @IBOutlet weak var tehsilBtn: CustomButton!
    @IBOutlet weak var searchBtn: CustomButton!
    
    @IBOutlet weak var cancelBtn: CustomButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchView.layer.cornerRadius = 10.0
        cancelBtn.isHidden = true
        searchView.layer.borderColor = UIColor.tintColor.cgColor
        searchView.layer.borderWidth = 1.5
       
    }
    

    @IBAction func LandLeaseVC(_ sender: Any) {
        performSegue(withIdentifier: "landLeaseToRuralDashSegue", sender: self)
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
