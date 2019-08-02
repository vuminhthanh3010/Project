//
//  InfoProfileViewController.swift
//  FitnessApps
//
//  Created by Minh Thanh on 7/30/19.
//  Copyright © 2019 Minh Thanh. All rights reserved.
//

import UIKit

class InfoProfileViewController: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate,UIPickerViewDataSource,UIPickerViewDelegate{
    
    @IBOutlet weak var tableViewInfoProfile: UITableView!
    @IBOutlet weak var ImageInfoProfile: UIImageView!
    @IBOutlet weak var nameInfoProfile: UILabel!
    let picker = UIPickerView()
    var toolBar = UIToolbar()
    var btn = UIButton()
    var arrayList   =   [String]()
    let listInfo    =   ["GENDER","AGE","WEIGHT","HEIGHT"]
    let listGender  =   ["Female","Male"]
    let listAge     =   Array(10...100)
    let listWeight  =   Array(10...200)
    let listHeight  =   Array(10...200)
    var key:String = ""
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title    =   "Thông tin cá nhân"
        navigationController?.navigationBar.topItem?.title  =   ""
        tableViewInfoProfile.tableFooterView    =   UIView()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ImageInfoProfile.layer.cornerRadius = ImageInfoProfile.frame.height / 2
        ImageInfoProfile.clipsToBounds = true
        
        tableViewInfoProfile.delegate   =   self
        tableViewInfoProfile.dataSource =   self
        picker.delegate =   self
        picker.dataSource   =   self
        
        if let name = UserDefaults.standard.string(forKey: "name"){
            self.nameInfoProfile.text    = name
        }
    }
    @IBAction func changeName(_ sender: UIButton) {
        let alert   =   UIAlertController(title: "Thông báo", message: "Tên của bạn là gì?", preferredStyle: .alert)
        alert.addTextField { (name) in
            name.placeholder    =   "Nhập tên của bạn"
        }
        let btnCancel   =   UIAlertAction(title: "Huỷ", style: .destructive) { (cancel) in}
        let btnOk       =   UIAlertAction(title: "Ok", style: .default) { (ok) in
            let saveName   =   alert.textFields![0].text!
            self.nameInfoProfile.text    =   saveName
            UserDefaults.standard.set(saveName, forKey: "name")
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
    
    @IBAction func btnChangeInfo(_ sender: UIButton) {
        
        if sender.tag   ==  0{
            sender.isEnabled    =   false
            btn = sender
            arrayList = listGender
            key = "gender"
            customPickerView()
            picker.reloadAllComponents()
        }else if sender.tag ==  1{
            sender.isEnabled    =   false
            btn = sender
            let stringListAge = listAge.map { String($0) }
            arrayList = stringListAge
            key = "age"
            customPickerView()
            picker.reloadAllComponents()
            
        }else if sender.tag ==  2{
            sender.isEnabled    =   false
            btn = sender
            let stringListWeight = listWeight.map { String($0) }
            arrayList = stringListWeight
            key =   "weight"
            customPickerView()
            picker.reloadAllComponents()
            
        }else if sender.tag ==  3{
            sender.isEnabled    =   false
            btn = sender
            let stringListHeight = listHeight.map { String($0) }
            arrayList = stringListHeight
            key =   "height"
            customPickerView()
            picker.reloadAllComponents()
            
        }
    }
    func customPickerView(){
        picker.backgroundColor = UIColor(red: 0.4902, green: 0.4902, blue: 0.4902, alpha: 1)
        picker.autoresizingMask = .flexibleWidth
        picker.contentMode = .center
        picker.frame = CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 300)
        self.view.addSubview(picker)
        
        toolBar = UIToolbar.init(frame: CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 50))
        toolBar.barStyle = .blackTranslucent
        toolBar.items = [UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(onCancelButtonTapped)), UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil), UIBarButtonItem.init(title: "Done", style: .done, target: self, action: #selector(onDoneButtonTapped))]
        self.view.addSubview(toolBar)
    }
    
    @objc func onCancelButtonTapped() {
        btn.isEnabled    =   true
        tableViewInfoProfile.reloadData()
        toolBar.removeFromSuperview()
        picker.removeFromSuperview()
    }
    @objc func onDoneButtonTapped() {
        btn.isEnabled    =   true
        toolBar.removeFromSuperview()
        picker.removeFromSuperview()
        tableViewInfoProfile.reloadData()
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arrayList[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        UserDefaults.standard.set(arrayList[row], forKey: key)
    }
    
    
}
extension InfoProfileViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell    =   tableViewInfoProfile.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! InfoProfileTableViewCell
        cell.Property.text      =   listInfo[indexPath.row]
        cell.btnValueInfo.tag   =   indexPath.row
        cell.selectionStyle =   .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
}
