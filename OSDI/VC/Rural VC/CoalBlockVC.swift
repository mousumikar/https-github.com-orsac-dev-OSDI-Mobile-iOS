//
//  CoalBlockVC.swift
//  OSDI
//
//  Created by Mousumi Kar on 25/04/23.
//

import UIKit

class CoalBlockVC: UIViewController {
  
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var cancelBtn: CustomButton!
    var checked = true
    override func viewDidLoad() {
        super.viewDidLoad()

        cancelBtn.isHidden = true
        searchView.layer.cornerRadius = 10.0
        searchView.layer.borderColor = UIColor.tintColor.cgColor
        searchView.layer.borderWidth = 1.5
    }
    

    @IBAction func backBtn(_ sender: Any) {
        performSegue(withIdentifier: "coalBlockToDashSegue", sender: self)
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
