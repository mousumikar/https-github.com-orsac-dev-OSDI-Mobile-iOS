//
//  ReportedGrievanceVC.swift
//  OSDI
//
//  Created by Shilpika Mohanty on 11/04/23.
//

import UIKit

class ReportedGrievanceVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let reportedCell = reportedCollectionView.dequeueReusableCell(withReuseIdentifier: "reportedCell", for: indexPath) as! ReportedGrievanceCell
//        pendingCell.backView.layer.cornerRadius = 10.0
        return reportedCell
    }
    
    
    
    @IBAction func backBtnrReported(_ sender: Any) {
        performSegue(withIdentifier: "reportedGrivToDashSegue", sender: self)
    }
    
    
    @IBOutlet weak var reportedCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    

    
}
