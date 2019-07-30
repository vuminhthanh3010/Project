//
//  MealPlansViewController.swift
//  FitnessApps
//
//  Created by Minh Thanh on 7/29/19.
//  Copyright © 2019 Minh Thanh. All rights reserved.
//

import UIKit

class MealPlansViewController: UIViewController {

    @IBOutlet weak var TableViewMealPlans: UITableView!
    var imgMealPlans    =   ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.tintColor   =   UIColor.white
        navigationController?.navigationBar.barTintColor    =   UIColor(red: 0.0784, green: 0.1137, blue: 0.1529, alpha: 1)
//        navigationController?.navigationBar.barTintColor    =   UIColor(red: 0.1059, green: 0.6039, blue: 0.6667, alpha: 1)

        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20),NSAttributedString.Key.foregroundColor: UIColor.white]
        tabBarController?.tabBar.tintColor  =   UIColor.white
        tabBarController?.tabBar.barTintColor   =   UIColor(red: 0.0784, green: 0.1137, blue: 0.1529, alpha: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        TableViewMealPlans.delegate     =   self
        TableViewMealPlans.dataSource   =   self
        TableViewMealPlans.separatorStyle   =   UITableViewCell.SeparatorStyle.none
        
        
    }

}
extension MealPlansViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  imgMealPlans.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell    =   TableViewMealPlans.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MealPlansTableViewCell
        cell.imageMealPlans.image   =   UIImage(named: imgMealPlans[indexPath.row])
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb  =   UIStoryboard(name: "Main", bundle: nil)
        let mh2 =   sb.instantiateViewController(withIdentifier: "detail") as! DetailMealPlansViewController
        mh2.id  =   imgMealPlans[indexPath.row]
        self.navigationController?.pushViewController(mh2, animated: true)
    }
}
