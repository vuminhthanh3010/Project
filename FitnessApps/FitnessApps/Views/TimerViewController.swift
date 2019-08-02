//
//  TimerViewController.swift
//  FitnessApps
//
//  Created by Minh Thanh on 8/1/19.
//  Copyright © 2019 Minh Thanh. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {
    
    @IBOutlet weak var myView: UIView!
    
    @IBOutlet weak var showTime: UILabel!
    @IBOutlet weak var btnRight: UIButton!
    @IBOutlet weak var btnleft: UIButton!
    
    @IBOutlet weak var btn20: UIButton!
    @IBOutlet weak var btn30: UIButton!
    @IBOutlet weak var btn45: UIButton!
    @IBOutlet weak var btn60: UIButton!
    @IBOutlet weak var btn90: UIButton!
    @IBOutlet weak var btn120: UIButton!
    
    
    @IBOutlet weak var btnPause: UIButton!
    @IBOutlet weak var btnStart: UIButton!
    var count:Int    =   0
    var timer   =   Timer()
    var countButton = 0
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title    =   "Hẹn giờ"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myView.layer.borderWidth    =   1
        myView.layer.cornerRadius = myView.frame.height / 2
        myView.clipsToBounds = true
        
        circleButton(button: btnleft)
        circleButton(button: btnRight)
        
        btnStart.layer.cornerRadius =   8
        btnPause.layer.cornerRadius =   8
        
        btnPause.isUserInteractionEnabled   =   false
        btnPause.backgroundColor    =   UIColor(red: 0.3176, green: 0.6118, blue: 0.8235, alpha: 0.4)
        showTime.text   =   "00:0\(count)"
        
    }
    
    @IBAction func btn20(_ sender: UIButton) {
        count = 20
        calculaterTime(count: count)
    }
    @IBAction func btn30(_ sender: UIButton) {
        count = 30
        calculaterTime(count: count)
    }
    
    @IBAction func btn45(_ sender: UIButton) {
        count = 45
        calculaterTime(count: count)
    }
    @IBAction func btn60(_ sender: UIButton) {
        count = 60
        calculaterTime(count: count)
    }
    @IBAction func btn90(_ sender: UIButton) {
        count = 90
        calculaterTime(count: count)
    }
    @IBAction func btn120(_ sender: UIButton) {
        count = 120
        calculaterTime(count: count)
    }
    
    @IBAction func btnAddTime(_ sender: UIButton) {
        count += 5
        calculaterTime(count: count)
    }
    
    @IBAction func btnReduced(_ sender: UIButton) {
        count -= 5
        if count >= 0{
            calculaterTime(count: count)
        }else{
            count = 0
            calculaterTime(count: count)
        }
    }
    
    @IBAction func btnStart(_ sender: UIButton) {
        
        btnStart.backgroundColor    =   UIColor(red: 0.3176, green: 0.6118, blue: 0.8235, alpha: 0.4)
        btnPause.backgroundColor    =   UIColor(red: 0.3176, green: 0.6118, blue: 0.8235, alpha: 1)
        btnPause.isUserInteractionEnabled   =   true
        btnStart.isUserInteractionEnabled   =   false
        customButton(bool: false, color: UIColor(red: 0.5412, green: 0.5412, blue: 0.5412, alpha: 1))
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(UpdateTime), userInfo: nil, repeats: true)
        
        if count <= 0{
            alert(title: "Bạn chưa chọn giờ gian")
            timer.invalidate()
        }
    }
    @objc func UpdateTime(){
        count -= 1
        calculaterTime(count: count)
        switch count {
        case 0:
            alert(title: "Hết giờ")
            timer.invalidate()
        default:
            break
        }
    }
    
    @IBAction func btnPause(_ sender: UIButton) {
        
        timer.invalidate()
        btnPause.backgroundColor    =   UIColor(red: 0.3176, green: 0.6118, blue: 0.8235, alpha: 0.4)
        btnStart.backgroundColor    =   UIColor(red: 0.3176, green: 0.6118, blue: 0.8235, alpha: 1)
        btnPause.isUserInteractionEnabled   =   false
        btnStart.isUserInteractionEnabled   =   true
        customButton(bool: false, color: UIColor(red: 0.5412, green: 0.5412, blue: 0.5412, alpha: 1))
        btnleft.titleLabel?.textColor =   UIColor.black
        btnleft.isUserInteractionEnabled =   true
        btnRight.titleLabel?.textColor =   UIColor.black
        btnRight.isUserInteractionEnabled =   true
    }
    @IBAction func btnReset(_ sender: UIButton) {
        timer.invalidate()
        btnPause.isUserInteractionEnabled   =   false
        btnStart.backgroundColor    =   UIColor(red: 0.3176, green: 0.6118, blue: 0.8235, alpha: 1)
        btnPause.backgroundColor    =   UIColor(red: 0.3176, green: 0.6118, blue: 0.8235, alpha: 0.4)
        count = 0
        showTime.text   =   "00:0\(count)"
        btnPause.isUserInteractionEnabled   =   true
        btnStart.isUserInteractionEnabled   =   true
        customButton(bool: true, color: UIColor.black)
    }
    func calculaterTime(count:Int){
        if count < 10{
            showTime.text   =   "00:0\(count)"
        }
        else if count >= 10 && count < 60{
            showTime.text   =   "00:\(count)"
        }else if count>=60 && count < 600{
            if count % 60 < 10{
                showTime.text   =   "0\((count-(count % 60))/60):0\(count % 60)"
            }else if count % 60 >= 10 && count % 60 < 60{
                showTime.text   =   "0\((count-(count % 60))/60):\(count % 60)"
            }
            
        }else if count > 600 && count < 3600{
            if count % 60 < 10{
                showTime.text   =   "\((count-(count % 60))/60):0\(count % 6)"
            }else if count % 60 >= 10 && count % 60 < 60{
                showTime.text   =   "\((count-(count % 60))/60):\(count % 60)"
            }
        }
    }
    
    func customButton(bool:Bool,color:UIColor){
        btn20.titleLabel?.textColor =   color
        btn20.isUserInteractionEnabled =   bool
        btn30.titleLabel?.textColor  =   color
        btn30.isUserInteractionEnabled =   bool
        btn45.titleLabel?.textColor  =   color
        btn45.isUserInteractionEnabled =   bool
        btn60.titleLabel?.textColor  =   color
        btn60.isUserInteractionEnabled =   bool
        btn90.titleLabel?.textColor  =   color
        btn90.isUserInteractionEnabled =   bool
        btn120.titleLabel?.textColor  =   color
        btn120.isUserInteractionEnabled =   bool
        btnleft.titleLabel?.textColor =   color
        btnleft.isUserInteractionEnabled =   bool
        btnRight.titleLabel?.textColor =   color
        btnRight.isUserInteractionEnabled =   bool
    }
    func circleButton(button:UIButton){
        button.layer.cornerRadius = button.frame.height / 2
        button.clipsToBounds = true
    }
    func alert(title:String){
        let alert = UIAlertController(title: "Thông báo", message: title, preferredStyle: .alert)
        let btnOk   =   UIAlertAction(title: "Ok", style: .default) { (ok) in
            self.btnPause.backgroundColor    =   UIColor(red: 0.3176, green: 0.6118, blue: 0.8235, alpha: 0.4)
            self.btnStart.backgroundColor    =   UIColor(red: 0.3176, green: 0.6118, blue: 0.8235, alpha: 1)
            self.btnPause.isUserInteractionEnabled   =   false
            self.btnStart.isUserInteractionEnabled   =   true
            self.customButton(bool: true, color: UIColor.black)
        }
        alert.addAction(btnOk)
        present(alert, animated: true, completion: nil)
    }
}
