//
//  RuralUrbanVC.swift
//  OSDI
//
//  Created by Shilpika Mohanty on 08/04/23.
//

import UIKit

class RuralUrbanVC: UIViewController {
    
    
    @IBOutlet weak var chooseAreaView: UIView!
    @IBOutlet weak var urbanBtn: UIButton!
    
    @IBOutlet weak var ruralBtn: UIButton!
    
    
    @IBAction func urbanButton(_ sender: Any) {
        performSegue(withIdentifier: "urbanSegue", sender: self)
    }
    
    
    @IBAction func ruralButton(_ sender: Any) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chooseAreaView.layer.cornerRadius = 6
        chooseAreaView.layer.shadowColor = UIColor.lightGray.cgColor
        chooseAreaView.layer.shadowOpacity = 0.5
        chooseAreaView.layer.shadowOffset = CGSize(width: 3, height: 3)
//
//        urbanBtn.layer.cornerRadius =  urbanBtn.frame.size.height/2
//        urbanBtn.layer.borderColor = UIColor.black.cgColor
//        urbanBtn.layer.borderWidth = 1.0
//        ruralBtn.layer.cornerRadius =  urbanBtn.frame.size.height/2
//        ruralBtn.layer.borderColor = UIColor.black.cgColor
//        ruralBtn.layer.borderWidth = 1.0
       
       

       
    }
    

   

}
