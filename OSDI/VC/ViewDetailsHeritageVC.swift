//
//  ViewDetailsHeritageVC.swift
//  OSDI
//
//  Created by Mousumi Kar on 17/04/23.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewDetailsHeritageVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(responseJsonData.count)
        return responseJsonData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let viewCell = viewDetailsCollectionView.dequeueReusableCell(withReuseIdentifier: "viewDetailsCell", for: indexPath) as! HeriViewDetailsCell
        
        viewCell.reportTypeLb.text = responseJsonData[indexPath.row]["observationRemarks"].string ?? "N.A"
        viewCell.villageLb.text = responseJsonData[indexPath.row]["villageName"].string ?? "N.A"
        viewCell.reportTypeLb.text = responseJsonData[indexPath.row]["grievanceTypeName"].string ?? "N.A"
        viewCell.plotNoLb.text = responseJsonData[indexPath.row]["plotNo"].string ?? "N.A"
        var dateLbl = responseJsonData[indexPath.row]["assignLdt"].string ?? "N.A"
        viewCell.assignedByLb.text = responseJsonData[indexPath.row]["assignByUser"].string ?? "N.A"
        viewCell.assignedToLb.text = responseJsonData[indexPath.row]["assignToUser"].string ?? "N.A"
        viewCell.assignedWorkLb.text = responseJsonData[indexPath.row]["assignWork"].string ?? "N.A"
        viewCell.statusLb.text = responseJsonData[indexPath.row]["assignStatus"].string ?? "N.A"
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = dateFormatter.date(from: dateLbl )
        var dateFormatter1 = DateFormatter()
        dateFormatter1.dateFormat = "dd-MM-yyyy"
        viewCell.dateLb.text = dateFormatter1.string(from: date ?? Date())
        print(viewCell.dateLb.text)
        if((responseJsonData[indexPath.row]["assignStatus"].string) == "REPORTED"){
            viewCell.statusLb.textColor = .systemYellow
            viewCell.colorView.backgroundColor = .systemYellow
        } else if ((responseJsonData[indexPath.row]["assignStatus"].string) == "REJECTED"){
            viewCell.statusLb.textColor = .systemRed
            viewCell.colorView.backgroundColor = .systemRed
        
        } else if ((responseJsonData[indexPath.row]["assignStatus"].string) == "COMPLETED"){
            
            viewCell.statusLb.textColor = .green
            viewCell.colorView.backgroundColor = .green
        } else {
            viewCell.statusLb.textColor = .orange
            viewCell.colorView.backgroundColor = .orange
        }
        
        
        
        
        
        
        
        
        
        
        viewCell.layer.cornerRadius = 10.0
        viewCell.layer.borderColor = UIColor.lightGray.cgColor
        viewCell.layer.borderWidth = 1.0
        viewCell.layer.shadowColor = UIColor.darkGray.cgColor
        viewCell.layer.shadowRadius = 2.0
        viewCell.layer.shadowOpacity = 0.1
        viewCell.layer.shadowOffset = CGSize(width:0 , height:5)
        return viewCell
        
        
    }
    
    
    @IBOutlet weak var viewDetailsCollectionView: UICollectionView!
    
    
    
    
    @IBAction func backToMapButton(_ sender: Any) {
        performSegue(withIdentifier: "backToMapSegue", sender: self)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        createPendingGrivDetails()
    }
    
    var selUserId = 8
    var selAppId = 4
    var responseJsonData:JSON = JSON()
    var api_key = "Bearer " + BEARER_TOKEN
    
    public func createPendingGrivDetails(){
        let urlString = "https://api.orsacosdi.in/OSDI2/api/work/getWorkAsgnListByUidAppId/8/4"
        sendPendingGrivDetails(Authorization: api_key, uid:selUserId ,appId:selAppId, url: urlString){ (response, error) in
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
                self.viewDetailsCollectionView.reloadData()


                print(json)

            }
        }
    }

    func sendPendingGrivDetails(Authorization: String,uid:Int , appId:Int , url:String, completion: @escaping (Any?, Error?) -> ()){
        
        
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
