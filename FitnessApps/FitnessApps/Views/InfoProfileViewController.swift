//
//  InfoProfileViewController.swift
//  FitnessApps
//
//  Created by Minh Thanh on 7/30/19.
//  Copyright © 2019 Minh Thanh. All rights reserved.
//

import UIKit

class InfoProfileViewController: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate{
    
    @IBOutlet weak var tableViewInfoProfile: UITableView!
    @IBOutlet weak var ImageInfoProfile: UIImageView!
    @IBOutlet weak var nameInfoProfile: UILabel!
    
    var infoProfile =   ["GENDER","AGE","WEIGHT","HEIGHT"]
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title    =   "Thông tin cá nhân"
        navigationController?.navigationBar.topItem?.title  =   ""
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20),NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = UIColor.white
        tableViewInfoProfile.tableFooterView    =   UIView()
    }
//    let pickerView = UIPickerView()

    override func viewDidLoad() {
        super.viewDidLoad()
        ImageInfoProfile.layer.cornerRadius = ImageInfoProfile.frame.height / 2
        ImageInfoProfile.clipsToBounds = true
        
        tableViewInfoProfile.delegate   =   self
        tableViewInfoProfile.dataSource =   self
//        pickerView.delegate =   self
//        pickerView.dataSource   =   self
    }
    @IBAction func changeName(_ sender: UIButton) {
        let alert   =   UIAlertController(title: "Thông báo", message: "Tên của bạn là gì?", preferredStyle: .alert)
        alert.addTextField { (name) in
            name.placeholder    =   "Nhập tên của bạn"
        }
        let btnCancel   =   UIAlertAction(title: "Huỷ", style: .destructive) { (cancel) in}
        let btnOk       =   UIAlertAction(title: "Ok", style: .default) { (ok) in
            self.nameInfoProfile.text    =   alert.textFields![0].text!
        }
        alert.addAction(btnCancel)
        alert.addAction(btnOk)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func changeImage(_ sender: UITapGestureRecognizer) {
            let alert   =   UIAlertController(title: "Thông báo", message: "Bạn có muỗn thay đổi ảnh đại diện?", preferredStyle: .actionSheet)
    
            let btnCamera       =   UIAlertAction(title: "Camera", style: .destructive) { (camera) in
                let imageController =   UIImagePickerController()
                imageController.delegate    =   self
                imageController.sourceType  =   .camera
                self.present(imageController, animated: true, completion: nil)
            }
            let btnLibrary       =   UIAlertAction(title: "Thư viện", style: .destructive) { (library) in
                let imageController =   UIImagePickerController()
                imageController.delegate    =   self
                imageController.sourceType  =   .photoLibrary
                self.present(imageController, animated: true, completion: nil)
            }
            let btnCancel   =   UIAlertAction(title: "Huỷ bỏ", style: .cancel) { (cancel) in}
            alert.addAction(btnCamera)
            alert.addAction(btnLibrary)
            alert.addAction(btnCancel)
    
            present(alert, animated: true, completion: nil)
        }
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            ImageInfoProfile.image   =   info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            ImageInfoProfile.contentMode =   .scaleAspectFill
            self.dismiss(animated: true, completion: nil)
        }
    
//
//    @IBAction func btnChangeInfo(_ sender: UIButton) {
//
//        pickerView.frame = CGRect.init(x: 0.0, y: 0, width: 300, height: 300)
//
//    }
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return infoProfile.count
//    }
//
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return infoProfile[component].count
//    }

}
extension InfoProfileViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoProfile.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell    =   tableViewInfoProfile.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! InfoProfileTableViewCell
        cell.Property.text      =   infoProfile[indexPath.row]
        cell.selectionStyle =   .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
}
