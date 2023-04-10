//
//  LandInfoSystemVC.swift
//  OSDI
//
//  Created by  Mousumi Kar on 08/04/23.
//

import UIKit
import MapKit
import GoogleMaps
import GooglePlaces

class LandInfoSystemVC: UIViewController , CLLocationManagerDelegate, GMSMapViewDelegate {
    
     let locationManager = CLLocationManager()
     var latValue = CLLocationDegrees()
     var longValue = CLLocationDegrees()
     var markerArray = Array<Any>()
     var marker:GMSMarker=GMSMarker()
     var markerArr = [GMSMarker]()
     var zoom: Float = 19.0
    
    
    @IBOutlet weak var mapView: GMSMapView!
    
    @IBOutlet weak var filterBtn: UIButton!
    
    
    @IBAction func backBtntoDashBoard(_ sender: Any) {
        performSegue(withIdentifier: "backToDashBoardSegue", sender: self)
    }
    
    
    @IBAction func filterButton(_ sender: Any) {
        performSegue(withIdentifier: "filterMapSegue", sender: self)
    }
    

    

    override func viewDidLoad() {
        super.viewDidLoad()
        latValue = 19.984250
        longValue = 85.580715
        let camera = GMSCameraPosition.camera(withLatitude: latValue, longitude: longValue, zoom: 19.0) // point the initial location of map
        mapView.camera = camera
        mapView.delegate = self
        mapView.mapType = GMSMapViewType.satellite
        self.locationManager.delegate = self
        self.locationManager.startUpdatingLocation()
        changeMarkerPos(lat: latValue, long: longValue)
    }
    func changeMarkerPos(lat: CLLocationDegrees , long: CLLocationDegrees) {
          let markerImage = UIImage(named: MAP_MARKER_NAME)
          //creating a marker view
          let markerView = UIImageView(image: markerImage)
          marker.position = CLLocationCoordinate2D(latitude: lat, longitude: long)
          marker.iconView = markerView
          marker.title = title
          marker.map = mapView
          latValue = lat
          longValue = long
          markerArr.append(marker)
          mapView.animate(toLocation: CLLocationCoordinate2D(latitude: lat, longitude: long))
          let camera = GMSCameraPosition.camera(withLatitude: lat, longitude: long, zoom: Float(19.0))
          mapView.camera = camera


      }

   
}
