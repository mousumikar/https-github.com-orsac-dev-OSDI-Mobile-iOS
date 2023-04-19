//
//  PendingGrievanceVC.swift
//  OSDI
//
//  Created by Mousumi Kar on 11/04/23.
//

import UIKit
import Alamofire
import SwiftyJSON

class PendingGrievanceVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(responseJsonData.count)
        return responseJsonData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let pendingCell = pendingCollectionView.dequeueReusableCell(withReuseIdentifier: "pendingCell", for: indexPath) as! PendingGrievanceCell
//        pendingCell.backView.layer.cornerRadius = 10.0
        pendingCell.penGrivTypeLb.text = responseJsonData[indexPath.row]["grievanceTypeName"].string ?? "N.A"
        pendingCell.pendingDtLb.text = responseJsonData[indexPath.row]["publicUserReportedDate"].string ?? "N.A"
        pendingCell.pendingStsLb.text = responseJsonData[indexPath.row]["publicStatus"].string ?? "N.A"
        pendingCell.pendingRemarkLb.text = responseJsonData[indexPath.row]["publicUserRemarks"].string ?? "N.A"
        pendingCell.pendingGrivTypeView.layer.cornerRadius = 10.0
        return pendingCell
    }
    
    
    @IBAction func backBtnPending(_ sender: Any) {
        performSegue(withIdentifier: "pendingGrivToDashSegue", sender: self)
    }
    

    @IBOutlet weak var pendingCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createPendingGrivDetails()

     
    }
    
    
    var selStatus = "PENDING"
    var responseJsonData:JSON = JSON()
    var api_key = "Bearer " + BEARER_TOKEN
    
    public func createPendingGrivDetails(){
        let urlString = "https://api.orsacosdi.in/OSDI2/api/gvm/getAllGrievanceDataByStatus/PENDING"
        sendPendingGrivDetails(Authorization: api_key, status: selStatus, url: urlString){ (response, error) in
            if(error != nil){
                print(error)
                let alert = UIAlertController(title: "Message!", message: "Something went wrong!! Please check your internet connection and try again!!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
//                do{
//                    self.images = try JSONDecoder().decode([Image].self, from: Data!)
//                }

            }else{
                //No Error
                let swiftyJsonVar = JSON(response)
                let json = JSON.init(parseJSON : swiftyJsonVar.rawString() ?? "")
                self.responseJsonData = json
                self.pendingCollectionView.reloadData()
                print(json)

            }
        }
    }

    func sendPendingGrivDetails(Authorization: String,status:String, url:String, completion: @escaping (Any?, Error?) -> ()){
        
        
        let headers: HTTPHeaders = [
            "Authorization": Authorization
        ]
        
        AF.request(url,headers: headers).responseJSON { response in
            switch response.result {
                        case .success(let result):
                            completion(result, nil)
                        case .failure(let error):
                            completion(nil, error)
                        }
        }

    }
    
   

}


