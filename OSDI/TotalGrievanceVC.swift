//
//  TotalGrievanceVC.swift
//  OSDI
//
//  Created by Shilpika Mohanty on 10/04/23.
//

import UIKit
import Alamofire
import SwiftyJSON

struct Image:Decodable{
    let img:String
}

class TotalGrievanceVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    var images = [Image]()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(responseJSONData.count)
        return responseJSONData.count

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = grievanceCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TotalGrievanceCell
        cell.backView.layer.cornerRadius = 10.0
        cell.grievanceTypeLb.text = responseJSONData[indexPath.row]["grievanceTypeName"].string ?? "N.A"
        cell.publicDateLb.text = responseJSONData[indexPath.row]["publicUserReportedDate"].string ?? "N.A"
        cell.pubRemarkLb.text = responseJSONData[indexPath.row]["publicUserRemarks"].string ?? "N.A"
        cell.publicStsLb.text = responseJSONData[indexPath.row]["publicStatus"].string ?? "N.A"
//        cell.publicImageView.image = responseJSONData[indexPath.row]["publicImgLocation"].string ?? "N.A"
        
//        let url = NSURL(string:"<https://api.orsacosdi.in/OSDI2/api/gvm/getAllGrievanceDataByStatus/ALL>")
//            let imagedata = NSData.init(contentsOf: url! as URL)
//
//        if imagedata != nil {
//            cell.publicImageView.image = UIImage(data:imagedata! as Data)
//        }
        
        cell.fieldDtLb.text = responseJSONData[indexPath.row]["fieldUserObserveDate"].string ?? "N.A"
        cell.fieldStsLb.text = responseJSONData[indexPath.row]["grievanceStatus"].string ?? "N.A"
        cell.fieldObservationLb.text = responseJSONData[indexPath.row]["fieldUserObservationRemarks"].string ?? "N.A"
        
        cell.superVisorDtLb.text = responseJSONData[indexPath.row]["supervisorAssignedDate"].string ?? "N.A"
        cell.supervisorStsLb.text = responseJSONData[indexPath.row]["grievanceStatus"].string ?? "N.A"
        cell.supervisorAssignedLb.text = responseJSONData[indexPath.row]["supervisorRemark"].string ?? "N.A"
       
//        cell.publicImageView.contentMode = .scaleToFill
//        let defaultLink = "https://api.orsacosdi.in/OSDI2/api/gvm/getAllGrievanceDataByStatus/ALL"
//        let completeLink = defaultLink + [indexPath.row].img
//        cell.publicImageView.downloaded(from: completeLink)
       return cell
     
    }
    
    
    
//    @IBOutlet weak var publicView: UIView!
//    @IBOutlet weak var backView: UIView!
//    @IBOutlet weak var grievanceTypeLb: UILabel!
//    @IBOutlet weak var publicDateLb: UILabel!
//    @IBOutlet weak var publicStsLb: UILabel!
//    @IBOutlet weak var pubRemarkLb: UILabel!
//    @IBOutlet weak var publicImageView: UIImageView!
//    @IBOutlet weak var fieldUserView: UIView!
//    @IBOutlet weak var fieldDtLb: UILabel!
//    @IBOutlet weak var fieldStsLb: UILabel!
//    @IBOutlet weak var fieldObservationLb: UILabel!
//    @IBOutlet weak var fieldImage: UIImageView!
//    @IBOutlet weak var supervisorView: UIView!
//    @IBOutlet weak var superVisorDtLb: UILabel!
//    @IBOutlet weak var supervisorStsLb: UILabel!
//    @IBOutlet weak var supervisorRemarkLb: UILabel!
//    @IBOutlet weak var supervisorAssignedLb: UILabel!
    
    
    
    
    
    
    
    @IBAction func backButton4(_ sender: Any) {
        performSegue(withIdentifier: "backToGrievanceSegue", sender: self)
    }
    
    @IBOutlet weak var grievanceCollectionView: UICollectionView!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTotalGrivDetails()
    }
    
    @IBAction func filterButton(_ sender: Any) {
        let myDatePicker: UIDatePicker = UIDatePicker()
        let myDatePicker1: UIDatePicker = UIDatePicker()
        myDatePicker.preferredDatePickerStyle = .compact
        myDatePicker1.preferredDatePickerStyle = .compact
        myDatePicker.frame = CGRect(x: 0, y: 0, width: 270, height: 200)
        myDatePicker1.frame = CGRect(x: 0, y: 50, width: 270, height: 200)
            let alertController = UIAlertController(title: "\n\n\n\n\n\n\n\n", message: nil, preferredStyle: .alert)
            alertController.view.addSubview(myDatePicker)
            alertController.view.addSubview(myDatePicker1)
            let selectAction = UIAlertAction(title: "Ok", style: .default, handler: { _ in
                print("Selected Date: \(myDatePicker.date)")
            })
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alertController.addAction(selectAction)
            alertController.addAction(cancelAction)
            present(alertController, animated: true)
    }
    
    
    var selStatus = "ALL"
    var responseJSONData:JSON = JSON()
    var api_key = "Bearer " + BEARER_TOKEN
    
    public func createTotalGrivDetails(){
        let urlString = "https://api.orsacosdi.in/OSDI2/api/gvm/getAllGrievanceDataByStatus/ALL"
        sendTotalGrivDetails(Authorization: api_key, status: selStatus, url: urlString){ (response, error) in
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
                self.grievanceCollectionView.reloadData()
                print(json)

            }
        }
    }

    func sendTotalGrivDetails(Authorization: String,status:String, url:String, completion: @escaping (Any?, Error?) -> ()){
        
        
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

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
