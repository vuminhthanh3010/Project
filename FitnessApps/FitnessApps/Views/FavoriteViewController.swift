//
//  FavoriteViewController.swift
//  FitnessApps
//
//  Created by Minh Thanh on 8/2/19.
//  Copyright © 2019 Minh Thanh. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController {
    
    var listFavorite    =   [String]()
    @IBOutlet weak var tableViewFavorite: UITableView!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title    =   "Bài tập yêu thích"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewFavorite.delegate      =   self
        tableViewFavorite.dataSource    =   self
        
        listFavorite.append(UserDefaults.standard.string(forKey: "value")!)
        print(listFavorite)
        tableViewFavorite.reloadData()
        
    }
    
}
extension FavoriteViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listFavorite.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell    =   tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FavoriteTableViewCell
        cell.imageFavorite.image    =   UIImage(named: listFavorite[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    
}
