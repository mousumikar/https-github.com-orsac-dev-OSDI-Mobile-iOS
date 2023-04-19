//
//  HeritageViewController.swift
//  OSDI
//
//  Created by Mousumi Kar on 11/04/23.
//

import UIKit
import Alamofire
import SwiftyJSON

class HeritageViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var selectedIndex = -1
    var isCollapse = false
 
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(responseJSONData.count)
        return responseJSONData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = heritageTableView.dequeueReusableCell(withIdentifier: "HeritageTableViewCell") as! HeritageTableViewCell
        cell.lbPlace.text = responseJSONData[indexPath.row]["heritageName"].string ?? "N.A"
        cell.lbDescription.text = responseJSONData[indexPath.row]["desription"].string ?? "N.A"
        cell.lbLocationDetails.text = responseJSONData[indexPath.row]["locationName"].string ?? "N.A"
        cell.heritageView.layer.cornerRadius = 10.0
        cell.heritageView.layer.shadowColor = UIColor.darkGray.cgColor
        cell.heritageView.layer.shadowRadius = 8.0
        cell.heritageView.layer.shadowOpacity = 0.30
        cell.heritageView.layer.shadowOffset = CGSize(width:0 , height:5)
        cell.heritageView.layer.borderWidth = 1
        cell.heritageView.layer.borderColor = UIColor.tintColor.cgColor
        cell.HeritageViewController = self
        
        if self.selectedIndex == indexPath.row && isCollapse == true
        {
//            return 495
            cell.viewMoreBtn.isHidden = true
            
        }else
        {
            cell.viewMoreBtn.isHidden = false
        }
    
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if self.selectedIndex == indexPath.row && isCollapse == true
        {
            return 495
            
        }else
        {
            return 200
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if selectedIndex == indexPath.row
        {
            if self.isCollapse == false
            {
                self.isCollapse = true
            }else
            {
                self.isCollapse = false
            }
            
        } else{
            self.isCollapse = true
        }
        self.selectedIndex = indexPath.row
        tableView.reloadRows(at: [indexPath], with: .automatic)

    }
    
    
    
    @IBOutlet weak var heritageTableView: UITableView!
    
    
    @IBAction func backBtnHerToDash(_ sender: Any) {
        performSegue(withIdentifier: "backHeritageToDashboardSegue", sender: self)
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        createHeritageDetails()
        
        heritageTableView.estimatedRowHeight = 495
        heritageTableView.rowHeight = UITableView.automaticDimension
    
        
    }
    var selcorp = "BMC"
    var responseJSONData:JSON = JSON()
    var api_key = "Bearer " + BEARER_TOKEN
    
    public func createHeritageDetails(){
        let urlString = "https://api.orsacosdi.in/OSDI2/api/heritage/getAllHeritageDataByCorporation?corp=BMC"
        sendHeritageDetails(Authorization: api_key, corp: selcorp, url: urlString){ (response, error) in
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
                self.responseJSONData = json
                self.heritageTableView.reloadData()
                print(json)

            }
        }
    }

    func sendHeritageDetails(Authorization: String,corp:String, url:String, completion: @escaping (Any?, Error?) -> ()){
        
        
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

   


