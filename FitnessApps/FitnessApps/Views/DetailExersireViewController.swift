//
//  DetailExersireViewController.swift
//  FitnessApps
//
//  Created by Minh Thanh on 8/1/19.
//  Copyright © 2019 Minh Thanh. All rights reserved.
//

import UIKit

class DetailExersireViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let jeremyGif = UIImage.gifImageWithName("demo")
        let imageView = UIImageView(image: jeremyGif)
        imageView.contentMode   =   .scaleToFill
        imageView.frame = CGRect(x: 0 ,y: 0, width: self.view.frame.size.width, height: 300)
        view.addSubview(imageView)
    }
    

}
