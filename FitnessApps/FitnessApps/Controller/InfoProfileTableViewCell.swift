//
//  InfoProfileTableViewCell.swift
//  FitnessApps
//
//  Created by Minh Thanh on 7/30/19.
//  Copyright © 2019 Minh Thanh. All rights reserved.
//

import UIKit

class InfoProfileTableViewCell: UITableViewCell{

    

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
        
        switch btnValueInfo.tag {
        case 0:
            if let gender = UserDefaults.standard.string(forKey: "gender") {
                btnValueInfo.setTitle(gender, for: .normal)
            }
            break
        case 1:
            if let age = UserDefaults.standard.string(forKey: "age") {
                btnValueInfo.setTitle(age, for: .normal)
            }
            break
        case 2:
            if let weight = UserDefaults.standard.string(forKey: "weight") {
                btnValueInfo.setTitle(weight, for: .normal)
            }
            break
        case 3:
            if let height = UserDefaults.standard.string(forKey: "height") {
                btnValueInfo.setTitle(height, for: .normal)
            }
            break
        default:
            break
        }
    }
}
