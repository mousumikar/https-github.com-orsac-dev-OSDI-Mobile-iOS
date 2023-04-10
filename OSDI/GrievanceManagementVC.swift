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
    }
    
    
    @IBAction func completedButton(_ sender: Any) {
    }
    
    @IBAction func reportedButton(_ sender: Any) {
    }
    
    @IBAction func recheckButton(_ sender: Any) {
    }
    
    
    @IBAction func assignedBtn(_ sender: Any) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    public func createVehicleViewDetails(){
        let urlString = BASE_URL + GRIEVANCE_COUNT
        sendValidationVehicleViewDetails(userId: 1,vehicleId: 1, url: urlString){ (response, error) in
            if(error != nil){
                let alert = UIAlertController(title: "Message!", message: "Something went wrong!! Please check your internet connection and try again!!", preferredStyle: .alert)

                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))

            }else{
                //No Error
                let swiftyJsonVar = JSON(response)
                let json = JSON.init(parseJSON : swiftyJsonVar.rawString() ?? "")
                self.responseJSONData = json
//                self.parseJSON(responseData: json)
                print(json)

            }
        }
    }

    func sendValidationVehicleViewDetails(userId: Int,vehicleId:Int, url:String, completion: @escaping (Any?, Error?) -> ()){
        AF.upload(multipartFormData: { multipartFormData in
            var params = [String:AnyObject]()
            params["userId"] = String(userId) as AnyObject
            params["vehicleId"] = String(vehicleId) as AnyObject
            for (key, value) in params {
                if let data = value.data(using: String.Encoding.utf8.rawValue) {
                    multipartFormData.append(data, withName: key)
                }
            }


            },to: url,method:HTTPMethod.post,
        headers:nil).responseString { response in
            switch response.result {
                        case .success(let result):
                            completion(result, nil)
                        case .failure(let error):
                            completion(nil, error)
                        }
        }
    }

    

}
