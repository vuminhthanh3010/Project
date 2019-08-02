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
