//
//  LowLyingAreaVC.swift
//  OSDI
//
//  Created by Mousumi Kar on 17/04/23.
//

import UIKit
import MapKit
import GoogleMaps
import GooglePlaces


class LowLyingAreaVC: UIViewController ,  CLLocationManagerDelegate, GMSMapViewDelegate {
    
    
    
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var wardBtn: CustomButton!
    @IBOutlet weak var intervalBtn1: UIButton!
    @IBOutlet weak var intervalBtn2: UIButton!
    @IBOutlet weak var intervalBtn: UIButton!
    @IBOutlet weak var severlyBtn: UIButton!
    @IBOutlet weak var moderateBtn: UIButton!
    @IBOutlet weak var lowBtn: UIButton!
    @IBOutlet weak var layerView: UIView!
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var mapLayerBtn: CustomButton!
    
    
    @IBOutlet weak var ulbBtn: UIButton!
    @IBOutlet weak var wardBoundaryBtn: UIButton!
    @IBOutlet weak var orthoBtn: UIButton!
    
    
    @IBOutlet weak var layerIntBtn1: UIButton!
    @IBOutlet weak var layerIntBtn2: UIButton!
    @IBOutlet weak var layerIntBtn3: UIButton!
    
    
    @IBOutlet weak var sevLowBtn: UIButton!
    @IBOutlet weak var modLowBtn: UIButton!
    @IBOutlet weak var sliLowBtn: UIButton!
    
    var checked = true
    
    
    
    @IBAction func intervalButton1(_ sender: UIButton) {
        
        if checked {
                sender.setImage( UIImage(named:"select-20.png"), for: .normal)
                checked = false
            intervalBtn2.isEnabled = false
            intervalBtn.isEnabled = false
            } else {
                sender.setImage(UIImage(named:"circle-20.png"), for: .normal)
                checked = true
                intervalBtn1.isEnabled = true
                intervalBtn.isEnabled = true
                intervalBtn2.isEnabled = true
            }
    }
    
    
    @IBAction func intervalButton2(_ sender: UIButton) {
        if checked {
                sender.setImage( UIImage(named:"select-20.png"), for: .normal)
                checked = false
            intervalBtn1.isEnabled = false
            intervalBtn.isEnabled = false
            } else {
                sender.setImage(UIImage(named:"circle-20.png"), for: .normal)
                checked = true
                intervalBtn1.isEnabled = true
                intervalBtn.isEnabled = true
                intervalBtn2.isEnabled = true
            }
    }
    
    
    
    @IBAction func intervalButton3(_ sender: UIButton) {
        if checked {
                sender.setImage( UIImage(named:"select-20.png"), for: .normal)
                checked = false
            intervalBtn1.isEnabled = false
            intervalBtn2.isEnabled = false
            } else {
                sender.setImage(UIImage(named:"circle-20.png"), for: .normal)
                checked = true
                intervalBtn1.isEnabled = true
                intervalBtn.isEnabled = true
                intervalBtn2.isEnabled = true
            }
    }
    
    
    
    @IBAction func severlyButton(_ sender: UIButton) {
        
        if checked {
                sender.setImage( UIImage(named:"checkBoxFill.png"), for: .normal)
                checked = false
            } else {
                sender.setImage(UIImage(named:"checkbox-24.png"), for: .normal)
                checked = true
            }
    }
    
    
    @IBAction func moderateButton(_ sender: UIButton) {
        
        if checked {
                sender.setImage( UIImage(named:"checkBoxFill.png"), for: .normal)
                checked = false
            } else {
                sender.setImage(UIImage(named:"checkbox-24.png"), for: .normal)
                checked = true
            }
    }
    
    
    
    @IBAction func lowButton(_ sender: UIButton) {
        
        if checked {
                sender.setImage( UIImage(named:"checkBoxFill.png"), for: .normal)
                checked = false
            } else {
                sender.setImage(UIImage(named:"checkbox-24.png"), for: .normal)
                checked = true
            }
    }
    
    
   
    
    
    
    @IBAction func layerButton(_ sender: Any) {
        if checked {
            layerView.isHidden = false
                checked = false
            } else {
                layerView.isHidden = true
                checked = true
            }
    }
    
    
    
    @IBAction func cancelButton(_ sender: Any) {
        layerView.isHidden = true
    }
    
    
    @IBAction func ulbButton(_ sender: UIButton) {
        if checked {
                sender.setImage( UIImage(named:"checkBoxFill.png"), for: .normal)
                checked = false
            } else {
                sender.setImage(UIImage(named:"checkbox-24.png"), for: .normal)
                checked = true
            }
    }
    
    
    @IBAction func wardBoundButton(_ sender: UIButton) {
        if checked {
                sender.setImage( UIImage(named:"checkBoxFill.png"), for: .normal)
                checked = false
            } else {
                sender.setImage(UIImage(named:"checkbox-24.png"), for: .normal)
                checked = true
            }
    }
    
    
    @IBAction func orthoButton2(_ sender: UIButton) {
        if checked {
                sender.setImage( UIImage(named:"checkBoxFill.png"), for: .normal)
                checked = false
            } else {
                sender.setImage(UIImage(named:"checkbox-24.png"), for: .normal)
                checked = true
            }
    }
    
    
    @IBAction func layerIntButton1(_ sender: Any) {
    }
    
    
    @IBAction func layerIntButton2(_ sender: Any) {
    }
    
    
    @IBAction func layerIntButton3(_ sender: Any) {
    }
    
    
    @IBAction func severlyLowButton(_ sender: UIButton) {
        if checked {
                sender.setImage( UIImage(named:"checkBoxFill.png"), for: .normal)
                checked = false
            } else {
                sender.setImage(UIImage(named:"checkbox-24.png"), for: .normal)
                checked = true
            }
    }
    
    
    @IBAction func moderateLowButton(_ sender: UIButton) {
        if checked {
                sender.setImage( UIImage(named:"checkBoxFill.png"), for: .normal)
                checked = false
            } else {
                sender.setImage(UIImage(named:"checkbox-24.png"), for: .normal)
                checked = true
            }
    }
    
    
    @IBAction func slightlyLowButton(_ sender: UIButton) {
        if checked {
                sender.setImage( UIImage(named:"checkBoxFill.png"), for: .normal)
                checked = false
            } else {
                sender.setImage(UIImage(named:"checkbox-24.png"), for: .normal)
                checked = true
            }
    }
    
    
    
    
    
    
    
    
    
    
    
    @IBAction func mapTypeButton(_ sender: Any) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
         alert.modalPresentationStyle = .custom


         let image = UIImage(named: "satellit_icon")
         let imageView = UIImageView()
         imageView.image = image
         imageView.frame =  CGRect(x: 25, y: 18, width: 24, height: 24)
         alert.view.addSubview(imageView)

         let image1 = UIImage(named: "default_map")
//        satellit_icon
          let imageView1 = UIImageView()
          imageView1.image = image1
          alert.view.addSubview(imageView1)
          imageView1.frame = CGRect(x: 25, y: 75, width: 24, height: 24)

        let sateliteMap = UIAlertAction(title: NSLocalizedString("Satelite Map", comment: ""), style: .default) { [self] action in
             mapView.mapType = GMSMapViewType.satellite
                }
        
        let defaultMap = UIAlertAction(title: NSLocalizedString("Default Map", comment: ""), style: .default) { [self] action in
             mapView.mapType = GMSMapViewType.normal
                }

          alert.addAction(sateliteMap)
          alert.addAction(defaultMap)
        alert.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor.white
        present(alert, animated: true, completion: nil)
    }
    
    
    
    
    
    
    
    
    
    @IBAction func backBtn(_ sender: Any) {
        performSegue(withIdentifier: "lowLyingBackToDashSegue", sender: self)
    }
    
    
    
    @IBAction func searchWardButton(_ sender: Any) {
        popUpView.isHidden = true
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    let viewToAnimate = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()
        popUpView.layer.cornerRadius = 12.0
        layerView.isHidden = true
        layerView.layer.cornerRadius = 6.0
    }
    

   
}
