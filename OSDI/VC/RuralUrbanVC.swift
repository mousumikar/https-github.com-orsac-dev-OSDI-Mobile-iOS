//
//  RuralUrbanVC.swift
//  OSDI
//
//  Created by Mousumi Kar on 08/04/23.
//

import UIKit

class RuralUrbanVC: UIViewController {
    
    
    @IBOutlet weak var chooseAreaView: UIView!
    @IBOutlet weak var urbanBtn: UIButton!
    @IBOutlet weak var ruralBtn: UIButton!
    @IBOutlet weak var urbanImgView: UIImageView!
    @IBOutlet weak var ruralImgView: UIImageView!
    
    
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
        urbanImgView.layer.cornerRadius = 6
        ruralImgView.layer.cornerRadius = 6
       

       
    }
    

   

}
