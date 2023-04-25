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
import RSSelectionMenu

class LandInfoSystemVC: UIViewController , CLLocationManagerDelegate, GMSMapViewDelegate {
    
     let locationManager = CLLocationManager()
     var latValue = CLLocationDegrees()
     var longValue = CLLocationDegrees()
     var markerArray = Array<Any>()
     var marker:GMSMarker=GMSMarker()
     var markerArr = [GMSMarker]()
     var zoom: Float = 19.0
    let simpleDataArray = ["ULB Boundary", "Ward Boundary", "Contour", "Ortho Image"]
    var simpleSelectedArray = [String]()
    
    @IBOutlet weak var mapView: GMSMapView!
    
    @IBOutlet weak var filterBtn: UIButton!
    
    
    @IBAction func backBtntoDashBoard(_ sender: Any) {
        performSegue(withIdentifier: "backToDashBoardSegue", sender: self)
    }
    
    
    @IBAction func filterButton(_ sender: Any) {
        performSegue(withIdentifier: "filterMapSegue", sender: self)
    }
    

    
    
    @IBAction func searchPlotBtn(_ sender: Any) {
        let alert = UIAlertController(title: "Search", message: "Plot No :", preferredStyle: .alert)
                alert.addTextField()
                alert.textFields![0].placeholder = "Enter Plot"
                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
                    print("Cancelled")
                }))
                alert.addAction(UIAlertAction(title: "Search", style: .default, handler: { (action) in
                    print("Cancelled")
                }))
                alert.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor.white
                self.present(alert, animated: true)
        
    }
    
    
    
    
    @IBAction func mapLayerBtn(_ sender: Any) {
        let selectionMenu = RSSelectionMenu(selectionStyle: .multiple, dataSource: simpleDataArray) { (cell, name, indexPath) in
            cell.textLabel?.text = name
            cell.tintColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
            cell.layer.backgroundColor = UIColor.white.cgColor
        }
        selectionMenu.setSelectedItems(items: simpleSelectedArray, maxSelected: 4) { [weak self] (item,vindex, selected, selectedItems) in
            self?.simpleSelectedArray = selectedItems
        }
      

        selectionMenu.cellSelectionStyle = .checkbox
        selectionMenu.show(style: .alert(title: "Layers", action: "Done", height: 200), from: self)
        
        
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
