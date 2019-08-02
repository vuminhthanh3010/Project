//
//  ProfileViewController.swift
//  FitnessApps
//
//  Created by Minh Thanh on 7/29/19.
//  Copyright © 2019 Minh Thanh. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var tableViewProfile: UITableView!
    @IBOutlet weak var imgHinh: UIImageView!
    @IBOutlet weak var showName: UILabel!
    
    
    var listProfile =   ["Thông tin tài khoản","Cài đặt"]
    var iconListProfile =   ["info","setting"]
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title    =   "Thông tin tài khoản"
        tableViewProfile.tableFooterView = UIView()
        
        if let name = UserDefaults.standard.string(forKey: "name"){
            self.showName.text    = name
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewProfile.delegate   =   self
        tableViewProfile.dataSource =   self
        
        imgHinh.layer.cornerRadius = imgHinh.frame.height / 2
        imgHinh.clipsToBounds = true
        
    }
    
    @IBAction func openInfoProfile(_ sender: UITapGestureRecognizer) {
        let sb  =   UIStoryboard(name: "Main", bundle: nil)
        let mh2 =   sb.instantiateViewController(withIdentifier: "info") as! InfoProfileViewController
        self.navigationController?.pushViewController(mh2, animated: true)
    }
    
}
extension ProfileViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listProfile.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell    =   tableViewProfile.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProfileTableViewCell
        cell.myImage.image  =   UIImage(named: iconListProfile[indexPath.row])
        cell.myTitle.text  =   listProfile[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let sb  =   UIStoryboard(name: "Main", bundle: nil)
        let mh2 =   sb.instantiateViewController(withIdentifier: "setting") as! SettingProfileViewController
        self.navigationController?.pushViewController(mh2, animated: true)
    }
    
}
