//
//  CompletedGrievanceVC.swift
//  OSDI
//
//  Created by Mousumi Kar on 11/04/23.
//

import UIKit
import Alamofire
import SwiftyJSON

class CompletedGrievanceVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(responseJsonData.count)
        return responseJsonData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let completedCell = completedCollectionView.dequeueReusableCell(withReuseIdentifier: "completedCell", for: indexPath) as! CompletedGrievanceCell
        completedCell.compGrivLb.text = responseJsonData[indexPath.row]["grievanceTypeName"].string ?? "N.A"
        completedCell.compDateLb.text = responseJsonData[indexPath.row]["publicUserReportedDate"].string ?? "N.A"
        completedCell.compStsLb.text = responseJsonData[indexPath.row]["publicStatus"].string ?? "N.A"
        completedCell.compRemarkLb.text = responseJsonData[indexPath.row]["publicUserRemarks"].string ?? "N.A"
        completedCell.completedGrivView.layer.cornerRadius = 10.0
        return completedCell
    }
    
    
    
    
    

    @IBAction func backBtnComp(_ sender: Any) {
        performSegue(withIdentifier: "completedGrivtoDashSegue", sender: self)
    }
    
    
    @IBOutlet weak var completedCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createCompletedGrivDetails()

       
    }
    var selStatus = "COMPLETED"
    var responseJsonData:JSON = JSON()
    var api_key = "Bearer " + BEARER_TOKEN
    
    public func createCompletedGrivDetails(){
        let urlString = "https://api.orsacosdi.in/OSDI2/api/gvm/getAllGrievanceDataByStatus/COMPLETED"
        sendCompletedGrivDetails(Authorization: api_key, status: selStatus, url: urlString){ (response, error) in
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
                self.completedCollectionView.reloadData()
                print(json)

            }
        }
    }

    func sendCompletedGrivDetails(Authorization: String,status:String, url:String, completion: @escaping (Any?, Error?) -> ()){
        
        
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
