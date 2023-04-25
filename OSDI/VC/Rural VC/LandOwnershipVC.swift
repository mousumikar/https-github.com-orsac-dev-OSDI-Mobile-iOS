//
//  LandOwnershipVC.swift
//  OSDI
//
//  Created by Shilpika Mohanty on 21/04/23.
//

import UIKit
import MapKit
import GoogleMaps
import GooglePlaces
import RSSelectionMenu

class LandOwnershipVC: UIViewController, CLLocationManagerDelegate, GMSMapViewDelegate  {
    
    var checked = true
    let simpleDataArray = ["Distrcit Boundary", "Tehsil Boundary", "Village Boundary","Cadastral","Government Land","Private Land","Forest Land","Ortho Image"]
    var simpleSelectedArray = [String]()
    
    
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var searchBtn: CustomButton!
    @IBOutlet weak var mapLayerBtn: CustomButton!
    @IBOutlet weak var mapTypeBtn: CustomButton!
    @IBOutlet weak var searchView: UIView!
    
    
    @IBOutlet weak var cancelBtn: CustomButton!
    
    @IBAction func backBtn(_ sender: Any) {
        performSegue(withIdentifier: "landOwnerToDashSegue", sender: self)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        searchView.layer.cornerRadius = 10.0
        cancelBtn.isHidden = true
    }
    

    
    @IBAction func searchFilterBtn(_ sender: Any) {
        if checked{
            searchView.isHidden = false
            checked = false
            
        } else{
            searchView.isHidden = true
            checked = true
            
        }
    }
    
    
    
    @IBAction func searchButton(_ sender: Any) {
        if checked{
            searchView.isHidden = false
            cancelBtn.isHidden = false
            checked = false
        } else{
            searchView.isHidden = true
            cancelBtn.isHidden = true
            checked = true
        }
        
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        if checked {
            searchView.isHidden = false
                checked = false
            } else {
                searchView.isHidden = true
             checked = true
            }
        
    }
    
    
    
    
    @IBAction func mapLayerButton(_ sender: Any) {
        let selectionMenu = RSSelectionMenu(selectionStyle: .multiple, dataSource: simpleDataArray) { (cell, name, indexPath) in
            cell.textLabel?.text = name
            cell.tintColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
            cell.layer.backgroundColor = UIColor.white.cgColor
        }
        selectionMenu.setSelectedItems(items: simpleSelectedArray, maxSelected: 8) { [weak self] (item,vindex, selected, selectedItems) in
            self?.simpleSelectedArray = selectedItems
        }
      

        selectionMenu.cellSelectionStyle = .checkbox
        selectionMenu.show(style: .alert(title: "Layers", action: "Done", height: 365), from: self)
        
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
    
    
    
}
