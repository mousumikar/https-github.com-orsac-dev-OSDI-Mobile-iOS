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
import RSSelectionMenu

class SolidWasteCollectionVC: UIViewController , CLLocationManagerDelegate, GMSMapViewDelegate {
    
    let simpleDataArray = ["ULB Boundary", "Ward Boundary", "Ortho Image"]
    var simpleSelectedArray = [String]()
    
    
    
    @IBAction func backBtn(_ sender: Any) {
        performSegue(withIdentifier: "backToFilterSegue", sender: self)
        
    }
    
    
    
    
    @IBOutlet weak var mapView: GMSMapView!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

  
    }
    
    
    
    
    @IBAction func filterMapButton(_ sender: Any) {
        performSegue(withIdentifier: "filterMapSegue", sender: self)
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
    

    @IBAction func mapLayerButton(_ sender: Any) {
        let selectionMenu = RSSelectionMenu(selectionStyle: .multiple, dataSource: simpleDataArray) { (cell, name, indexPath) in
            cell.textLabel?.text = name
            cell.tintColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
            cell.layer.backgroundColor = UIColor.white.cgColor
        }
        selectionMenu.setSelectedItems(items: simpleSelectedArray, maxSelected: 3) { [weak self] (item,vindex, selected, selectedItems) in
            self?.simpleSelectedArray = selectedItems
        }
      

        selectionMenu.cellSelectionStyle = .checkbox
        selectionMenu.show(style: .alert(title: "Layers", action: "Done", height: 150), from: self)
        
    }
}
