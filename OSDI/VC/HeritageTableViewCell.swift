//
//  HeritageTableViewCell.swift
//  OSDI
//
//  Created by Mousumi Kar on 11/04/23.
//

import UIKit

class HeritageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lbPlace: UILabel!
    @IBOutlet weak var lbDescription: UILabel!
    @IBOutlet weak var lbLocDetails: UILabel!
    @IBOutlet weak var lbLocationDetails: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var viewMoreBtn: UIButton!
    @IBOutlet weak var viewLessButton: UIButton!
    @IBOutlet weak var heritageView: UIView!
    
    @IBOutlet weak var viewLessBtn: UIButton!
    
    weak var HeritageViewController: HeritageViewController?
    var cell = UITableViewCell()
    var selectedIndex = -1
    var isCollapse = false
    
    @IBAction func mapBtn(_ sender: Any) {
        self.HeritageViewController?.performSegue(withIdentifier: "heritageMapSegue", sender: self)
    }
    
    
    
    @IBAction func viewMoreButton(_ sender: Any) {
        
    }
    
    
    
    
    @IBAction func viewLessButton(_ sender: Any) {
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

      
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //set the values for top,left,bottom,right margins
        let margins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        contentView.frame = contentView.frame.inset(by: margins)
    }
}
