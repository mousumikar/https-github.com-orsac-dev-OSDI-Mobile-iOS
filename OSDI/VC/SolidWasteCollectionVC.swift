//
//  SolidWasteCollectionVC.swift
//  OSDI
//
//  Created by Mousumi Kar on 17/04/23.
//

import UIKit
import MapKit
import GoogleMaps
import GooglePlaces

class SolidWasteCollectionVC: UIViewController , CLLocationManagerDelegate, GMSMapViewDelegate {
    
    
    @IBAction func backBtn(_ sender: Any) {
        performSegue(withIdentifier: "backToFilterSegue", sender: self)
        
    }
    
    
    
    
    @IBOutlet weak var mapView: GMSMapView!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

  
    }
    

 

}
