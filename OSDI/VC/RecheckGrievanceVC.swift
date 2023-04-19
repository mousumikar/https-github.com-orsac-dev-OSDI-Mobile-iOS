//
//  RecheckGrievanceVC.swift
//  OSDI
//
//  Created by Mousumi Kar on 11/04/23.
//

import UIKit

class RecheckGrievanceVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let recheckCell = recheckCollectionView.dequeueReusableCell(withReuseIdentifier: "recheckCell", for: indexPath) as! RecheckGrievanceCell
        return recheckCell
    }
    
    
    @IBOutlet weak var recheckCollectionView: UICollectionView!

    @IBAction func backBtnRechcek(_ sender: Any) {
        
        performSegue(withIdentifier: "recheckGrivtoDashSegue", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }
    

}
