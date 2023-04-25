//
//  LandDeviationVC.swift
//  OSDI
//
//  Created by Mousumi Kar on 18/04/23.
//

import UIKit
import MapKit
import GoogleMaps
import GooglePlaces

class LandDeviationVC: UIViewController ,CLLocationManagerDelegate, GMSMapViewDelegate {
    
    var checked = true
    
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var searchWardBtn: CustomButton!
    @IBOutlet weak var mapLayerBtn: CustomButton!
    @IBOutlet weak var mapTypeBtn: CustomButton!
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var selectWardBtn: CustomButton!
    @IBOutlet weak var layerView: UIView!
    
    
    @IBAction func searchBtn(_ sender: Any) {
        popUpView.isHidden = true
    }
    
    
    @IBAction func selectWardButton(_ sender: Any) {
    }
    
    @IBAction func searchButton(_ sender: Any) {
        if checked{
            popUpView.isHidden = false
            checked = false
        } else{
            popUpView.isHidden = true
            checked = true
        }
    }
    
 
    
    @IBAction func mapLayerButton(_ sender: Any) {
        if checked {
            layerView.isHidden = false
                checked = false
            } else {
                layerView.isHidden = true
                checked = true
            }
    }
    
    
    @IBAction func cancelButton(_ sender: Any) {
        if checked {
            layerView.isHidden = false
                checked = false
            } else {
                layerView.isHidden = true
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
    
    

    
    @IBAction func backFromDeviToDash(_ sender: Any) {
        performSegue(withIdentifier: "landDevToDashSegue", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        popUpView.layer.cornerRadius = 12.0
        layerView.isHidden = true
        layerView.layer.cornerRadius = 6.0
        
    }
    

    

}
