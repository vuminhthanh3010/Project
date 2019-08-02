//
//  FavoriteTableViewCell.swift
//  FitnessApps
//
//  Created by Minh Thanh on 8/2/19.
//  Copyright © 2019 Minh Thanh. All rights reserved.
//

import UIKit

class FavoriteTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageFavorite: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
