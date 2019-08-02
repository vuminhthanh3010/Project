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
    
    var imgCategoryABS    =   ["hardStylePlank","deadBug","dumbbellSideBend","birdDog","barbellBackSquat","extension"]
    var imgCategoryBACK     =   ["barbellDeadlift","kettlebellSwing","pullUp","sumbbellSingleArmRow","singleArmTBarRows","latPullDowns","InvertedRow","farmersWalk"]
    var idCategory:Int?
    var category   =   [String]()
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.topItem?.title  =   ""
        
        if idCategory! == 0{
            navigationItem.title    =   "Bài Tập Bụng"
        }else if idCategory! == 1{
            navigationItem.title    =   "Bài Tập Lưng"
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        idCategory = UserDefaults.standard.integer(forKey: "idCategory")
        if idCategory! == 0{
            navigationItem.title    =   "Bài Tập Bụng"
        }else if idCategory! == 1{
            navigationItem.title    =   "Bài Tập Lưng"
        }
        tableViewCategoryExersire.delegate      =   self
        tableViewCategoryExersire.dataSource    =   self
        
    }
}
extension CategoryExersireViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch idCategory! {
        case 0:
            category   =   imgCategoryABS
            break
        case 1:
            category   =   imgCategoryBACK
            break
        default:
            break
        }
        return category.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell    =   tableViewCategoryExersire.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CategoryExersireTableViewCell
        switch idCategory! {
        case 0:
            cell.imgCategoryExersire.image  =   UIImage(named: imgCategoryABS[indexPath.row])
            break
        case 1:
            cell.imgCategoryExersire.image  =   UIImage(named: imgCategoryBACK[indexPath.row])
            break
        default:
            break
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let mh2 =   sb.instantiateViewController(withIdentifier: "detailExersire") as! DetailExersireViewController
        UserDefaults.standard.set(category[indexPath.row], forKey: "idDetail")
        mh2.id =    indexPath.row
        self.navigationController?.pushViewController(mh2, animated: true)
    }
    
}
