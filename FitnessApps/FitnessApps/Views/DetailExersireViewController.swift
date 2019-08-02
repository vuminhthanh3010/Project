//
//  DetailExersireViewController.swift
//  FitnessApps
//
//  Created by Minh Thanh on 8/1/19.
//  Copyright © 2019 Minh Thanh. All rights reserved.
//

import UIKit

class DetailExersireViewController: UIViewController,UIWebViewDelegate {
    
    var idDetail:String?
    var count = 0
    var favorite    =   false
    var id:Int?
    var favoriteButton = UIBarButtonItem()
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.topItem?.title  =   ""
        if UserDefaults.standard.bool(forKey: idDetail!) == true{
            favoriteButton.setBackgroundImage(UIImage(named: "starOn1"), for: .normal, barMetrics: .default)
            favorite    =   true
        }else{
            favoriteButton.setBackgroundImage(UIImage(named: "starOff1"), for: .normal, barMetrics: .default)
            favorite    =   false
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        idDetail = UserDefaults.standard.string(forKey: "idDetail")
        navigationItem.title    =   idDetail
        
        let myWebView:UIWebView = UIWebView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        
        self.view.addSubview(myWebView)
        
        myWebView.delegate = self
        //3. Load local html file into web view
        let myProjectBundle:Bundle = Bundle.main
        
        let filePath:String = myProjectBundle.path(forResource: idDetail, ofType: "html")!
        
        let myURL = URL(string: filePath);
        let myURLRequest:URLRequest = URLRequest(url: myURL!)
        
        DispatchQueue.main.async {
            myWebView.loadRequest(myURLRequest)
        }
        
        favoriteButton   = UIBarButtonItem(title: "",  style: .plain, target: self, action: #selector(didTapEditButton))
        favoriteButton.setBackgroundImage(UIImage(named: "starOff1"), for: .normal, barMetrics: .default)
        self.navigationItem.rightBarButtonItem = favoriteButton
        
    }
    
    @objc func didTapEditButton(sender: AnyObject) {
        if favorite == true{
            favoriteButton.setBackgroundImage(UIImage(named: "starOff1"), for: .normal, barMetrics: .default)
            UserDefaults.standard.set(false, forKey: idDetail!)
            
            
        }else{
            favoriteButton.setBackgroundImage(UIImage(named: "starOn1"), for: .normal, barMetrics: .default)
            UserDefaults.standard.set(true, forKey: idDetail!)
            UserDefaults.standard.set(idDetail!, forKey: "value")
        }
    }
}
