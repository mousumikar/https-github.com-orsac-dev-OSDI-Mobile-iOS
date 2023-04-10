//
//  TotalGrievanceVC.swift
//  OSDI
//
//  Created by Shilpika Mohanty on 10/04/23.
//

import UIKit

class TotalGrievanceVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = grievanceCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TotalGrievanceCell
        cell.backView.layer.cornerRadius = 10.0
        return cell
    }
    
    @IBAction func backButton4(_ sender: Any) {
        performSegue(withIdentifier: "backToGrievanceSegue", sender: self)
    }
    

    @IBOutlet weak var grievanceCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

   

}
