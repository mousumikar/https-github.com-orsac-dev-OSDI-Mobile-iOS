//
//  HeritageMapVC.swift
//  OSDI
//
//  Created by Mousumi Kar on 13/04/23.
//

import UIKit
import MapKit
import GoogleMaps
import GooglePlaces
import RSSelectionMenu

class HeritageMapVC: UIViewController {
    
    
    @IBOutlet weak var mapView: GMSMapView!
    
    @IBOutlet weak var mapLayerBtn: CustomButton!
    
    let simpleDataArray = ["ULB Boundary", "Ward Boundary", "Contour", "Ortho Image"]
    var simpleSelectedArray = [String]()
    
    
    @IBAction func backBtnToHeritage(_ sender: Any) {
        performSegue(withIdentifier: "heritageMapToHeritageSegue", sender: self)
    }
    
    

    @IBAction func searchButton(_ sender: Any) {
        performSegue(withIdentifier: "villageFilterSegue", sender: self)
//        let alert = UIAlertController(title: "Search", message: "Village:", preferredStyle: .alert)
//        alert.addTextField()
//        alert.addTextField()
//        alert.textFields![0].placeholder = "Enter Village"
//        alert.textFields![1].placeholder = "Enter Plot"
//        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
//            print("Cancelled")
//        }))
//        alert.addAction(UIAlertAction(title: "Search", style: .default, handler: { (action) in
//            print("Cancelled")
//        }))
//        self.present(alert, animated: true)
//
        }
    
   
    
    
    @IBAction func mapLayerButton(_ sender: Any) {
        
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
    
    
    
    @IBAction func mapInfoBtn(_ sender: Any) {
        let attributedString = NSAttributedString(string: "Nandankanan", attributes: [
            NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16), //your font here
            NSAttributedString.Key.foregroundColor : UIColor.tintColor
        ])
        
        let MessageString = NSAttributedString(string: "You can always access your content by signing back in:", attributes: [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15), //your font here
            NSAttributedString.Key.foregroundColor : UIColor.darkGray
        ])
        let alert = UIAlertController(title: "Nandankanan", message: "You can always access your content by signing back in",         preferredStyle: UIAlertController.Style.alert)
       
        alert.setValue(attributedString, forKey: "attributedTitle")
        alert.setValue(MessageString, forKey: "attributedMessage")
        
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { _ in
                   //Cancel Action
               }))
        
        alert.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor.white
               self.present(alert, animated: true, completion: nil)
       
    }
    
    
    @IBAction func mapBufferBtn(_ sender: Any) {
        let attributedString = NSAttributedString(string: "Buffer", attributes: [
            NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16), //your font here
            NSAttributedString.Key.foregroundColor : UIColor.tintColor
        ])
        
        let MessageString = NSAttributedString(string: "Distance:", attributes: [
            NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15), //your font here
            NSAttributedString.Key.foregroundColor : UIColor.tintColor
        ])
        let alert = UIAlertController(title: "Buffer", message: "Distance:", preferredStyle: .alert)
        alert.setValue(attributedString, forKey: "attributedTitle")
        alert.setValue(MessageString, forKey: "attributedMessage")
        alert.addTextField()
        alert.textFields![0].placeholder = "In mtr"
            
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
            print("Cancelled")
        }))
        alert.addAction(UIAlertAction(title: "Search", style: .default, handler: { (action) in
            print("Cancelled")
        }))
        alert.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor.white
        alert.view.tintColor = UIColor.tintColor
        self.present(alert, animated: true)
    }
    
    
    
    @IBAction func mapDetailsBtn(_ sender: Any) {
        performSegue(withIdentifier: "mapToViewDetailsSegue", sender: self)
    }
    
        
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    

   
}
