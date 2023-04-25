//
//  AssignedGrievanceVC.swift
//  OSDI
//
//  Created by Mousumi Kar on 11/04/23.
//

import UIKit
import Alamofire
import SwiftyJSON

class AssignedGrievanceVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(responseJsonData.count)
        return responseJsonData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let assignedCell = assignedCollectionView.dequeueReusableCell(withReuseIdentifier: "assignedCell", for: indexPath) as! AssignedGrievanceCell
        assignedCell.assignGrivTypeLb.text = responseJsonData[indexPath.row]["grievanceTypeName"].string ?? "N.A"
        assignedCell.assignDtLb.text = responseJsonData[indexPath.row]["publicUserReportedDate"].string ?? "N.A"
        assignedCell.assignStsLb.text = responseJsonData[indexPath.row]["publicStatus"].string ?? "N.A"
        assignedCell.assignRemarkLb.text = responseJsonData[indexPath.row]["publicUserRemarks"].string ?? "N.A"
        assignedCell.assignedGrivTypeView.layer.cornerRadius = 10.0
        return assignedCell
    }
    
    @IBOutlet weak var assignedCollectionView: UICollectionView!
    
    
    @IBAction func backBtnAssigned(_ sender: Any) {
        performSegue(withIdentifier: "assignedGrivToDashSegue", sender: self)
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        createAssignedGrivDetails()
    }
    
    var selStatus = "ASSIGNED"
    var responseJsonData:JSON = JSON()
    var api_key = "Bearer " + BEARER_TOKEN
    
    public func createAssignedGrivDetails(){
        let urlString = "https://api.orsacosdi.in/OSDI2/api/gvm/getAllGrievanceDataByStatus/ASSIGNED"
        sendAssignedDetails(Authorization: api_key, status: selStatus, url: urlString){ (response, error) in
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
                self.assignedCollectionView.reloadData()
                print(json)

            }
        }
    }

    func sendAssignedDetails(Authorization: String,status:String, url:String, completion: @escaping (Any?, Error?) -> ()){
        
        
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
