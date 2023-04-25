//
//  GovtLandInfoDetailsVC.swift
//  OSDI
//
//  Created by Mousumi Kar on 21/04/23.
//

import UIKit
import Alamofire
import SwiftyJSON

class GovtLandInfoDetailsVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = govtCollectionView.dequeueReusableCell(withReuseIdentifier: "govtLandInfoCell", for: indexPath) as! GovtLandInfoCell
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    

    @IBOutlet weak var govtCollectionView: UICollectionView!
    
    
    
    @IBAction func backBtn(_ sender: Any) {
        performSegue(withIdentifier: "backToGovtLandSegue", sender: self)
        
        
    }
}
