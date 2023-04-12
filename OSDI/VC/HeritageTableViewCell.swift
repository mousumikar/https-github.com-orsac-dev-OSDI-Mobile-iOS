//
//  HeritageTableViewCell.swift
//  OSDI
//
//  Created by Shilpika Mohanty on 11/04/23.
//

import UIKit

class HeritageTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var lbPlace: UILabel!
    @IBOutlet weak var lbDescription: UILabel!
    @IBOutlet weak var lbLocDetails: UILabel!
    @IBOutlet weak var lbLocationDetails: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var viewMoreBtn: UIButton!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

      
    }

}
