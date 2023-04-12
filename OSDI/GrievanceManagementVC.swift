//
//  GrievanceManagementVC.swift
//  OSDI
//
//  Created by Shilpika Mohanty on 10/04/23.
//

import UIKit
import Alamofire
import SwiftyJSON

class GrievanceManagementVC: UIViewController {
      
    var responseJSONData:JSON = JSON()
    var api_key = "Bearer " + BEARER_TOKEN
    
    
    @IBOutlet weak var totalGrievanceBtn: CustomButton!
    @IBOutlet weak var pendingBtn: CustomButton!
    @IBOutlet weak var completedBtn: CustomButton!
    @IBOutlet weak var reportedBtn: CustomButton!
    @IBOutlet weak var recheckBtn: CustomButton!
    @IBOutlet weak var assignedBtn: CustomButton!
    @IBOutlet weak var totalGrivLb: UILabel!
    @IBOutlet weak var pendingLb: UILabel!
    @IBOutlet weak var completedLb: UILabel!
    @IBOutlet weak var reportedLb: UILabel!
    @IBOutlet weak var recheckLb: UILabel!
    @IBOutlet weak var assignedLb: UILabel!
    
    
    @IBAction func backBtn3(_ sender: Any) {
        performSegue(withIdentifier: "backDashboardGrievanceSegue", sender: self)
        
    }
    
    @IBAction func totalGrievanceButton(_ sender: Any) {
        performSegue(withIdentifier: "grievanceSegue", sender: self)
    }
    
    @IBAction func pendingButton(_ sender: Any) {
        performSegue(withIdentifier: "pendingGrivSegue", sender: self)
    }
    
    
    @IBAction func completedButton(_ sender: Any) {
        performSegue(withIdentifier: "completedGrivSegue", sender: self)
    }
    
    @IBAction func reportedButton(_ sender: Any) {
        performSegue(withIdentifier: "reportedGrivSegue", sender: self)
    }
    
    @IBAction func recheckButton(_ sender: Any) {
        performSegue(withIdentifier: "recheckGrivSegue", sender: self)
    }
    
    
    @IBAction func assignedBtn(_ sender: Any) {
        performSegue(withIdentifier: "assignedGrivSegue", sender: self)
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createGrivDetails()
        
    }
    
    
    public func createGrivDetails(){
        let urlString = "https://api.orsacosdi.in/OSDI2/api/gvm/getGrievanceDashBoardCountByUserId/8"
        sendGrivDetails(Authorization: api_key, userId: 8, url: urlString){ (response, error) in
            if(error != nil){
                print(error)
                let alert = UIAlertController(title: "Message!", message: "Something went wrong!! Please check your internet connection and try again!!", preferredStyle: .alert)

                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))

            }else{
                //No Error
                let swiftyJsonVar = JSON(response)
                let json = JSON.init(parseJSON : swiftyJsonVar.rawString() ?? "")
                self.responseJSONData = json
                self.parseJson(responseData: json)
                print(json)

            }
        }
    }

    func sendGrivDetails(Authorization: String,userId:Int, url:String, completion: @escaping (Any?, Error?) -> ()){
        
        
        let headers: HTTPHeaders = [
            "Authorization": Authorization
        ]
        
        AF.request(url,
                          headers: headers).responseJSON { response in
            switch response.result {
                        case .success(let result):
                            completion(result, nil)
                        case .failure(let error):
                            completion(nil, error)
                        }
        }

        
//        AF.upload(multipartFormData: { multipartFormData in
//            var params = [String:AnyObject]()
//            params["Authorization"] = String(Authorization) as AnyObject
//            params["userId"] = String(userId) as AnyObject
//            for (key, value) in params {
//                if let data = value.data(using: String.Encoding.utf8.rawValue) {
//                    multipartFormData.append(data, withName: key)
//                }
//            }
//
//
//            },to: url,method:HTTPMethod.get,
//        headers:nil).responseString { response in
//            switch response.result {
//                        case .success(let result):
//                            completion(result, nil)
//                        case .failure(let error):
//                            completion(nil, error)
//                        }
//        }
    }

    
    func parseJson(responseData: JSON) {
        let totalGriv = responseData["totalGrievanceCount"].int ?? -1
        let totalGrivCount = String(totalGriv)
        totalGrivLb.text = totalGrivCount
        print(totalGrivCount)
        
        let pending = responseData["totalPendingGrievanceCount"].int ?? -1
        let pendingCount = String(pending)
        pendingLb.text = pendingCount
        
        let completed = responseData["totalCompletedGrievanceCount"].int ?? -1
        let completedCount = String(completed)
        completedLb.text = completedCount
        
        
        let reported = responseData["totalReportedGrievanceCount"].int ?? -1
        let reportedCount = String(reported)
        reportedLb.text = reportedCount
        let recheck = responseData["totalGrievanceRecheckCount"].int ?? -1
        let recheckCount = String(recheck)
        recheckLb.text = recheckCount
        
        let assigned = responseData["totalAssignedGrievanceCount"].int ?? -1
        let assignedCount = String(assigned)
        assignedLb.text = assignedCount
        
        
        
      }

  

    

}

