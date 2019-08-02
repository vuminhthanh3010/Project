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
        let mh2 =   sb.instantiateViewController(withIdentifier: "detailMealPlans") as! DetailMealPlansViewController
        mh2.id  =   imgMealPlans[indexPath.row]
        self.navigationController?.pushViewController(mh2, animated: true)
    }
}
