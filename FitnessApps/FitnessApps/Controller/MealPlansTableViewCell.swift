//
//  MealPlansTableViewCell.swift
//  FitnessApps
//
//  Created by Minh Thanh on 7/29/19.
//  Copyright © 2019 Minh Thanh. All rights reserved.
//

import UIKit

class MealPlansTableViewCell: UITableViewCell {

    @IBOutlet weak var imageMealPlans: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageMealPlans.layer.cornerRadius   =   10
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
