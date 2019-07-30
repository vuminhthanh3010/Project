//
//  InfoProfileTableViewCell.swift
//  FitnessApps
//
//  Created by Minh Thanh on 7/30/19.
//  Copyright © 2019 Minh Thanh. All rights reserved.
//

import UIKit

class InfoProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var Property: UILabel!
    @IBOutlet weak var btnValueInfo: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        btnValueInfo.layer.borderWidth     =   0.5
        btnValueInfo.layer.cornerRadius    =   13
    }

}
