//
//  DetailMealPlansViewController.swift
//  FitnessApps
//
//  Created by Minh Thanh on 7/29/19.
//  Copyright © 2019 Minh Thanh. All rights reserved.
//

import UIKit
import WebKit

class DetailMealPlansViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    var id:String?
    override func loadView() {
        webView = WKWebView()
        view = webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        switch id! {
        case "Monday":
            navigationItem.title = "Ngày thứ hai"
            break
        case "Tuesday":
            navigationItem.title = "Ngày thứ ba"
            break
        case "Wednesday":
            navigationItem.title = "Ngày thứ tư"
            break
        case "Thursday":
            navigationItem.title = "Ngày thứ năm"
            break
        case "Friday":
            navigationItem.title = "Ngày thứ sáu"
            break
        case "Saturday":
            navigationItem.title = "Ngày thứ bảy"
            break
        case "Sunday":
            navigationItem.title = "Ngày chủ nhật"
            break

        default:
            break
        }
        let url = URL(string: "https://fitnessworkout2019.000webhostapp.com/\(id!).html")!
        DispatchQueue.main.async {
            self.webView.load(URLRequest(url: url))
        }
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }

}
