//
//  CategoryExersireTableViewCell.swift
//  FitnessApps
//
//  Created by Minh Thanh on 8/1/19.
//  Copyright © 2019 Minh Thanh. All rights reserved.
//

import UIKit

class CategoryExersireTableViewCell: UITableViewCell {

    @IBOutlet weak var imgCategoryExersire: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }


    @IBAction func favorite(_ sender: UIButton) {
        sender.setImage(UIImage(named: "starOn"), for: .normal)
    }
    
}
