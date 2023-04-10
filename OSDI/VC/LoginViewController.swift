//
//  LoginViewController.swift
//  OSDI
//
//  Created by Shilpika Mohanty on 07/04/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginView: UIView!
    
    
    @IBOutlet weak var userNameTxt: UITextField!
    
    @IBOutlet weak var passwordTxt: UITextField!
    
    @IBOutlet weak var forgotpasswordBtn: UIButton!
    
    @IBOutlet weak var loginBtn: UIButton!
    
    @IBOutlet weak var signUpBtn: UIButton!
    
    
    @IBOutlet weak var hidePasswordBtn: UIButton!
    
    
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
        
        
    }
    
   
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
