//
//  RoadExtWideningVC.swift
//  OSDI
//
//  Created by Mousumi Kar on 19/04/23.
//

import UIKit
import MapKit
import GoogleMaps
import GooglePlaces

class RoadExtWideningVC: UIViewController,CLLocationManagerDelegate, GMSMapViewDelegate {
    
    var checked = true
    
    @IBAction func roadExtToDashBackButton(_ sender: Any) {
        performSegue(withIdentifier: "roadExtToDashSegue", sender: self)
        
    }

    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var mapLayerView: UIView!
    @IBAction func mapLayerBtn(_ sender: Any) {
        if checked {
            mapLayerView.isHidden = false
                checked = false
            } else {
                mapLayerView.isHidden = true
                checked = true
            }
        
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        if checked {
            mapLayerView.isHidden = false
                checked = false
            } else {
                mapLayerView.isHidden = true
             checked = true
            }
    }
 
    @IBAction func mapTypeBtn(_ sender: Any) {
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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        mapLayerView.layer.cornerRadius = 10.0
        mapLayerView.isHidden = true
       
    }
    

   
}
