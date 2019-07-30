//
//  ExersireViewController.swift
//  FitnessApps
//
//  Created by Minh Thanh on 7/27/19.
//  Copyright © 2019 Minh Thanh. All rights reserved.
//

import UIKit

class ExersireViewController: UIViewController {

    

    @IBOutlet weak var TableViewExersire: UITableView!
    var listExersire    =  ["abs","back","biceps","chest","legs","shoulder","triceps"]
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        navigationController?.navigationBar.barTintColor    =   UIColor(red: 0.6392, green: 0.0314, blue: 0, alpha: 0.8)
        navigationController?.navigationBar.barTintColor    =   UIColor(red: 0.0784, green: 0.1137, blue: 0.1529, alpha: 1)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20),NSAttributedString.Key.foregroundColor: UIColor.white]
        tabBarController?.tabBar.tintColor  =   UIColor.white
        tabBarController?.tabBar.barTintColor   =   UIColor(red: 0.0784, green: 0.1137, blue: 0.1529, alpha: 1)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableViewExersire.delegate      =   self
        TableViewExersire.dataSource    =   self





        
    }
}

extension ExersireViewController:UITableViewDataSource,UITableViewDelegate{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listExersire.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell    =   TableViewExersire.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ExersireTableViewCell
        cell.imgExersire.image  =   UIImage(named: listExersire[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
}
