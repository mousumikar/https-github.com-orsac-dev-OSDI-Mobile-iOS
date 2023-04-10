//
//  FilterLandInfoVC.swift
//  OSDI
//
//  Created by Shilpika Mohanty on 09/04/23.
//

import UIKit

class FilterLandInfoVC: UIViewController {
    
    
    @IBOutlet weak var lbWard: UILabel!
    @IBOutlet weak var lbVillage: UILabel!
    

    @IBOutlet weak var wardBtn: UIButton!
    
    @IBOutlet weak var villageBtn: UIButton!
    
    
    @IBAction func backBtnToLand(_ sender: Any) {
        performSegue(withIdentifier: "backToLandInfoSegue", sender: self)
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        wardBtn.layer.cornerRadius = 6.0
        villageBtn.layer.cornerRadius = 6.0
        wardBtn.layer.borderColor = UIColor.tintColor.cgColor
        villageBtn.layer.borderColor = UIColor.tintColor.cgColor
        wardBtn.layer.borderWidth = 2.0
        villageBtn.layer.borderWidth = 2.0
        
    }
    

    

}
