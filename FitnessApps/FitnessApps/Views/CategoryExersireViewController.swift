//
//  CategoryExersireViewController.swift
//  FitnessApps
//
//  Created by Minh Thanh on 8/1/19.
//  Copyright © 2019 Minh Thanh. All rights reserved.
//

import UIKit

class CategoryExersireViewController: UIViewController {

    @IBOutlet weak var tableViewCategoryExersire: UITableView!
    
    var imgCategoryABS    =   ["hardstylePlank","deadBug","dumbbellSideBend","birdDog","barbellBackSquat","extension"]
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.topItem?.title  =   ""
        navigationController?.navigationBar.barTintColor    =   UIColor(red: 0.0784, green: 0.1137, blue: 0.1529, alpha: 1)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20),NSAttributedString.Key.foregroundColor: UIColor.white]
        tabBarController?.tabBar.tintColor  =   UIColor.white
        tabBarController?.tabBar.barTintColor   =   UIColor(red: 0.0784, green: 0.1137, blue: 0.1529, alpha: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title    =   "Bài tập bụng"
        tableViewCategoryExersire.delegate      =   self
        tableViewCategoryExersire.dataSource    =   self
    }
}
extension CategoryExersireViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imgCategoryABS.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell    =   tableViewCategoryExersire.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CategoryExersireTableViewCell
        cell.imgCategoryExersire.image  =   UIImage(named: imgCategoryABS[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let mh2 =   sb.instantiateViewController(withIdentifier: "detailExersire") as! DetailExersireViewController
        self.navigationController?.pushViewController(mh2, animated: true)
    }
    
}
