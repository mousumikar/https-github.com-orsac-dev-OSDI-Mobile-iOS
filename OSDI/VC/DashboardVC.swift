//
//  DashboardVC.swift
//  OSDI
//
//  Created by Shilpika Mohanty on 08/04/23.
//

import UIKit

class DashboardVC: UIViewController {
    
    
    @IBOutlet weak var landInfoBtn: MDButton!
    @IBOutlet weak var profileBtn: UIButton!
    
    
    @IBAction func profileButton(_ sender: Any) {
        let alertController = UIAlertController(title: "Choose Option", message: " ", preferredStyle: .alert)

//             let view4 = UIAlertAction(title: "Delete Vehicle", style: .default, handler: nil)
              
             let view1 = UIAlertAction(title: "Profile", style: .default, handler: {(action) -> Void in
             self.performSegue(withIdentifier: "MyProfileSegue", sender: self)
            })
             let view2 = UIAlertAction(title: "Change Password", style: .default, handler: {(action) -> Void in
              self.performSegue(withIdentifier: "changePasswordSegue", sender: self)
           })
            let view3 = UIAlertAction(title: "Log Out", style: .default, handler: {(action) -> Void in
//            self.VehicleListViewController?.performSegue(withIdentifier: "TrackDeviceSegue", sender: self)
          })

        // Accessing alert view backgroundColor :
           alertController.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor.white
             
           // Accessing buttons tintcolor :
             alertController.view.tintColor = UIColor.black
             alertController.addAction(view1)
             alertController.addAction(view2)
             alertController.addAction(view3)
//             alertController.addAction(view4)
             self.present(alertController, animated: true, completion: nil)
    }
    
    
    @IBAction func landInfoButton(_ sender: Any) {
        performSegue(withIdentifier: "LandInfoSystemSegue", sender: self)
    }
    
    
    @IBAction func backBtn(_ sender: Any) {
        performSegue(withIdentifier: "backSegue", sender: self)
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    

}
