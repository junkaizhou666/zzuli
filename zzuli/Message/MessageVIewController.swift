//
//  MessageVIewController.swift
//  zzuli
//
//  Created by 周俊凯 on 2024/12/4.
//

import UIKit
import SnapKit

class MessageViewController: UIViewController {
    
    private var statusBarBackgroundView: UIView!
    private var customNavBar: CustomNavigationBar!
    private var buttonStackView: ButtonStackView!
    private var informationVC: InformationViewController!
    private var topBackgroundView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupStatusBarBackground()
        setupNavBar()
        setupButtonStackView()
        setupInformationVC()
    }
    
    private func setupStatusBarBackground() {
        statusBarBackgroundView = UIView()
        statusBarBackgroundView.backgroundColor = .blue
        view.addSubview(statusBarBackgroundView)
        
        statusBarBackgroundView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(44)
        }
    }
    
    private func setupNavBar() {
        customNavBar = CustomNavigationBar()
        customNavBar.navigationBar.barTintColor = .blue
        customNavBar.navigationBar.isTranslucent = false
        customNavBar.hideLeftButton()
        customNavBar.setTitle("综合信息")
        customNavBar.setRightButtonTitle("通知") {
            // 右侧按钮点击事件
            print("右侧按钮点击")
        }
        view.addSubview(customNavBar)
        customNavBar.snp.makeConstraints { make in
            make.top.equalTo(statusBarBackgroundView.snp.bottom)
            make.leading.trailing.equalToSuperview()
        }
    }
    
    private func setupButtonStackView() {
        buttonStackView = ButtonStackView(buttons: [
            (image: UIImage(named: "icon"), title: "周会表"),
            (image: UIImage(named: "icon"), title: "班车查询"),
            (image: UIImage(named: "icon"), title: "通讯指南"),
            (image: UIImage(named: "icon"), title: "校历查询")
        ])
        view.addSubview(buttonStackView)
        buttonStackView.snp.makeConstraints { make in
            make.top.equalTo(customNavBar.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(100)
        }
    }
    
    private func setupInformationVC() {
        informationVC = InformationViewController()
        addChild(informationVC)
        view.addSubview(informationVC.view)
        informationVC.didMove(toParent: self)
        informationVC.view.snp.makeConstraints { make in
            make.top.equalTo(buttonStackView.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(400)
        }
    }
}

