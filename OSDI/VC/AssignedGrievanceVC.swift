//
//  AssignedGrievanceVC.swift
//  OSDI
//
//  Created by Shilpika Mohanty on 11/04/23.
//

import UIKit

class AssignedGrievanceVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let assignedCell = assignedCollectionView.dequeueReusableCell(withReuseIdentifier: "assignedCell", for: indexPath) as! AssignedGrievanceCell
        return assignedCell
    }
    
    @IBOutlet weak var assignedCollectionView: UICollectionView!
    
    
    @IBAction func backBtnAssigned(_ sender: Any) {
        performSegue(withIdentifier: "assignedGrivToDashSegue", sender: self)
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    
}
