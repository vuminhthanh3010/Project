//
//  SettingProfileViewController.swift
//  FitnessApps
//
//  Created by Minh Thanh on 7/30/19.
//  Copyright © 2019 Minh Thanh. All rights reserved.
//

import UIKit

class SettingProfileViewController: UIViewController {

    @IBOutlet weak var TableViewProfile: UITableView!

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.topItem?.title =   ""
        navigationController?.navigationBar.tintColor   =   .white
        navigationController?.navigationBar.barTintColor    =   UIColor(red: 0.1765, green: 0.2275, blue: 0.2275, alpha: 1)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20),NSAttributedString.Key.foregroundColor: UIColor.white]
        tabBarController?.tabBar.tintColor  =   UIColor.white
        tabBarController?.tabBar.barTintColor   =   UIColor(red: 0.0784, green: 0.1137, blue: 0.1529, alpha: 1)
        TableViewProfile.tableFooterView = UIView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title =   "Cài đặt"
        TableViewProfile.delegate   =   self
        TableViewProfile.dataSource =   self
    }
}
extension SettingProfileViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell    =   TableViewProfile.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SettingProfileTableViewCell
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
}
