//
//  HeritageViewController.swift
//  OSDI
//
//  Created by Shilpika Mohanty on 11/04/23.
//

import UIKit

class HeritageViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var selectedIndex = -1
    var isCollapse = false
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = heritageTableView.dequeueReusableCell(withIdentifier: "HeritageTableViewCell") as! HeritageTableViewCell
         cell.lbPlace.text! = placeArr[indexPath.row]
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if self.selectedIndex == indexPath.row && isCollapse == true
        {
            return 555
            
        }else
        {
            return 250
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
     var placeArr = ["BBSR","Puri","Cuttack","Konark"]
    
    
    @IBAction func backBtnHerToDash(_ sender: Any) {
        performSegue(withIdentifier: "heritageToDashSegue", sender: self)
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        heritageTableView.estimatedRowHeight = 555
        heritageTableView.rowHeight = UITableView.automaticDimension

        
    }
    

   

}
