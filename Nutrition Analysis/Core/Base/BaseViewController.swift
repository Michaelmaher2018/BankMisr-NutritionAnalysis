//
//  BaseViewController.swift
//  Nutrition Analysis
//
//  Created by user on 07/06/2021.
//

import UIKit
import RxSwift
import RxCocoa

class BaseViewController: UIViewController {

    let activityIndicator = CActivityIndicator()

    func setNavigationBarTitle(text: String, color: UIColor? = UIColor.init(hex: "070707")) {
        let lbl = UILabel()
        lbl.text = text
        lbl.textColor = color ?? .red
        lbl.font = UIFont(name: "Helvetica-Neue-Bold", size: 18)
        self.navigationItem.titleView = lbl
    }
    
    func navigationBarColor( color: UIColor? = UIColor.init(hex: "20314D")) {
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.barTintColor = color
        UIApplication.shared.statusBarStyle = .lightContent
    }

    func setNavBarClear() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
    }
    
    func removeNavBorder() {
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }

    func showLoadingInticator() {
        activityIndicator.start()
    }
    
    func hideLoadingInticator() {
        activityIndicator.stop()
    }
}
