//
//  LoginViewController.swift
//  OSDI
//
//  Created by Mousumi Kar on 07/04/23.
//

import UIKit
import Alamofire
import SwiftyJSON

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginView: UIView!
    
    
    @IBOutlet weak var userNameTxt: UITextField!
    
    @IBOutlet weak var passwordTxt: UITextField!
    
    @IBOutlet weak var forgotpasswordBtn: UIButton!
    
    @IBOutlet weak var loginBtn: UIButton!
    
    @IBOutlet weak var signUpBtn: UIButton!
    
    
    @IBOutlet weak var hidePasswordBtn: UIButton!
    
    var responseJsonData:JSON = JSON()
    
    
     let yourAttributes: [NSAttributedString.Key: Any] = [
        .font: UIFont.boldSystemFont(ofSize: 12.0),
         .foregroundColor: UIColor.lightGray,
         .underlineStyle: NSUnderlineStyle.single.rawValue
     ] // .double.rawValue, .thick.rawValue
    
    @IBAction func forgotPasswordButton(_ sender: Any) {
    }
    
    @IBAction func loginButton(_ sender: Any) {
        performSegue(withIdentifier: "mainSegue", sender: self)
        loginView.isHidden = true
        login()
        
    }
    
    public func login(){
        let urlString = BASE_URL + LOGIN
        sendLogin(username: "Admin01" ,password: "Admin01", url: urlString){ (response, error) in
            if(error != nil){
                //Error Here
              //  LoadingIndicatorView.hide()
                let alert = UIAlertController(title: "Message!", message: "Something went wrong!! Please check your internet connection and try again!!", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true)
            }else{
                //No Error
                let swiftyJsonVar = JSON(response)
                let json = JSON.init(parseJSON : swiftyJsonVar.rawString() ?? "")
                print(json)
                
               // self.saveData(responseData: json)
            
              //      LoadingIndicatorView.hide()
                    let alert = UIAlertController(title: "Message!", message: "OOPS!! You are not registered!! Please contact OFMS Admin to register in OFMS Mobile!!", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    self.present(alert, animated: true)
                
            }
        }
    }
    
    
    func sendLogin(username: String,password: String, url:String, completion: @escaping (Any?, Error?) -> ()){
    
            AF.upload(multipartFormData: { multipartFormData in
                var params = [String:AnyObject]()
                params["username"] = String(username) as AnyObject
                params["password"] = String(password) as AnyObject
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
    
//    private func saveData(responseData: JSON){
//
//        if(responseData["device_availability"].string == "1"){
//
//            do {
//
//                let mobileNoVal = responseData["mobile_no"].string ?? ""
//
//                let deviceAvailabilityVal = responseData["device_availability"].string ?? ""
//
//                let activeVal = responseData["active"].string ?? ""
//
//                let nameVal = responseData["name"].string ?? ""
//
//                var designationVal = responseData["designation"].string ?? ""
//
//                let device_registerVal = responseData["device_availability"].string ?? ""
//
//                let max_jurisdictionVal = responseData["max_jurisdiction"].string ?? ""
//
//                let state_nameVal = responseData["jurisdiction_details"]["state"].string ?? ""
//
//                var circle_nameVal = responseData["jurisdiction_details"]["circle"].string ?? ""
//
//                let division_nameVal = responseData["jurisdiction_details"]["division"].string ?? ""
//
//                var range_nameVal = responseData["jurisdiction_details"]["range"].string ?? ""
//
//                let section_nameVal = responseData["jurisdiction_details"]["section"].string ?? ""
//
//                var beat_nameVal = responseData["jurisdiction_details"]["beat"].string ?? ""
//
//                try? db?.run(deviceDetails.delete())
//
//                let rowid = try? db?.run(deviceDetails.insert(id <- 0,mobileNo <- mobileNoVal,deviceAvailability <- deviceAvailabilityVal,active <- activeVal, designation <- designationVal, device_register <- device_registerVal, max_jurisdiction <- max_jurisdictionVal, state_name <- state_nameVal, circle_name <- circle_nameVal,
//                                                              division_name <- division_nameVal,
//                                                              range_name <- range_nameVal, section_name <- section_nameVal,
//                                                              beat_name <- beat_nameVal,
//                                                              name <- nameVal))
////                print("inserted id: \(rowid)")
//
//
//            } catch {
////                print("insertion failed: \(error)")
//                isActive=false
//            }
//        }else{
//            isActive=false
//        }
//    }
//
   
    @IBAction func signUpButton(_ sender: Any) {
    }
    
    @IBAction func hidePasswordButton(_ sender: UIButton) {
        if hidePassword {
            sender.setImage( UIImage(named:"showPassword.png"), for: .normal)
                passwordTxt.isSecureTextEntry = false
                hidePassword = false
            } else {
                (sender as AnyObject).setImage(UIImage(named:"hidePassword.png"), for: .normal)
                passwordTxt.isSecureTextEntry = true
                hidePassword = true
            }
        
    }
    
    
    var hidePassword = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userNameTxt.attributedPlaceholder = NSAttributedString(string:"Username", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray , .font: UIFont.boldSystemFont(ofSize: 14.0)  ])

        passwordTxt.attributedPlaceholder = NSAttributedString(string:"Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray , .font: UIFont.boldSystemFont(ofSize: 14.0)  ])
    
        
        userNameTxt.layer.borderColor = UIColor.black.cgColor
        
        loginBtn.layer.cornerRadius = 4

        let attributeString = NSMutableAttributedString(
                string: "For sign up go to web portal",
                attributes: yourAttributes
             )
             signUpBtn.setAttributedTitle(attributeString, for: .normal)

    }
    

}

//extension UIView{
//    func addBottomBorderWidthColor(color:UIColor , width:CGFloat) {
//        let border = CALayer()
//        border.backgroundColor = color.cgColor
//        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width - 25, height: width)
//        self.layer.addSublayer(border)
//    }
//}
//
//
//extension UITextField{
//    func addPaddingToTextField() {
//        let paddingView:UIView = UIView.init(frame: CGRect(x: 0, y: 0, width: 8, height: 0))
//        self.leftView = paddingView;
//        self.leftViewMode = .always
//        self.rightView = paddingView
//        self.rightViewMode = .always
//    }
//}
