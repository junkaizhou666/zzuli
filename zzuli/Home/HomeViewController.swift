//
//  HomeViewController.swift
//  zzuli
//
//  Created by 周俊凯 on 2024/12/4.
//

import UIKit

class HomeViewController: UIViewController {
    private var statusBarView: UIView!
    private var aboveCustomNavBar: CustomNavigationBar!
    private var lowerCustomNavBar: CustomNavigationBar!
    private var imageView: ImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupStatusBar()
        setupAboveNavBar()
        setuplowerNavBar()
        //setupImageView()
    }

    private func setupStatusBar() {
        statusBarView = UIView()
        statusBarView.backgroundColor = .blue
        view.addSubview(statusBarView)
        
        statusBarView.snp.makeConstraints { make in
            make.top.right.left.equalToSuperview()
            make.height.equalTo(44)
        }
    }
    
    private func setupAboveNavBar() {
        aboveCustomNavBar = CustomNavigationBar()
        aboveCustomNavBar.navigationBar.barTintColor = .blue
        aboveCustomNavBar.navigationBar.isTranslucent = false
        aboveCustomNavBar.hideLeftButton()
        aboveCustomNavBar.setTitle("首页")
        aboveCustomNavBar.setRightButtonTitle("扫一扫", titleColor: .white) {
            print("扫一扫点击")
        }
        view.addSubview(aboveCustomNavBar)
        
        aboveCustomNavBar.snp.makeConstraints { make in
            make.top.equalTo(statusBarView.snp.bottom)
            make.left.right.equalToSuperview()
        }
    }
    
    private func setuplowerNavBar() {
        lowerCustomNavBar = CustomNavigationBar()
        lowerCustomNavBar.navigationBar.barTintColor = .lightGray
        lowerCustomNavBar.navigationBar.isTranslucent = false
        lowerCustomNavBar.setTitle("")
        lowerCustomNavBar.setLeftButtonTitle("导航", titleColor: .black) {
            print("导航点击")
        }
        lowerCustomNavBar.setRightButtonTitle("更多", titleColor: .black) {
            print("更多点击")
        }
        view.addSubview(lowerCustomNavBar)
        
        lowerCustomNavBar.snp.makeConstraints { make in
            make.top.equalTo(aboveCustomNavBar.snp.bottom)
            make.left.right.equalToSuperview()
        }
    }
    
    private func setupImageView() {
        imageView = ImageView()
        view.addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(lowerCustomNavBar.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(600)
        }
    }
}
