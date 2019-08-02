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
        navigationItem.title    =   "Các bài tập"
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb  =   UIStoryboard(name: "Main", bundle: nil)
        let mh2 =   sb.instantiateViewController(withIdentifier: "category") as! CategoryExersireViewController
        UserDefaults.standard.set(indexPath.row, forKey: "idCategory")
        self.navigationController?.pushViewController(mh2, animated: true)
    }
    
}
