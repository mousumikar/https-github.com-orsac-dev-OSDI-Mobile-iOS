//
//  CompletedGrievanceVC.swift
//  OSDI
//
//  Created by Shilpika Mohanty on 11/04/23.
//

import UIKit

class CompletedGrievanceVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let completedCell = completedCollectionView.dequeueReusableCell(withReuseIdentifier: "completedCell", for: indexPath) as! CompletedGrievanceCell
//        pendingCell.backView.layer.cornerRadius = 10.0
        return completedCell
    }
    
    
    
    
    

    @IBAction func backBtnComp(_ sender: Any) {
        performSegue(withIdentifier: "completedGrivtoDashSegue", sender: self)
    }
    
    
    @IBOutlet weak var completedCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    

  

}
