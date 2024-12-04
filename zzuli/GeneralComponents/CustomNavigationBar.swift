//
//  CustomNavigationBar.swift
//  zzuli
//
//  Created by 周俊凯 on 2024/12/4.
//

import UIKit
import SnapKit

class CustomNavigationBar: UIView {
    
    // MARK: - UI Elements
    private let leftButton = UIButton()
    private let rightButton = UIButton()
    private let titleLabel = UILabel()
    
    // MARK: - Properties
    var leftButtonAction: (() -> Void)?
    var rightButtonAction: (() -> Void)?
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    // MARK: - Setup UI
    private func setupView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        // Setup Left Button
        leftButton.setTitle("Left", for: .normal)
        leftButton.setTitleColor(.blue, for: .normal)
        leftButton.addTarget(self, action: #selector(leftButtonTapped), for: .touchUpInside)
        addSubview(leftButton)
        
        // Setup Right Button
        rightButton.setTitle("Right", for: .normal)
        rightButton.setTitleColor(.blue, for: .normal)
        rightButton.addTarget(self, action: #selector(rightButtonTapped), for: .touchUpInside)
        addSubview(rightButton)
        
        // Setup Title Label
        titleLabel.text = "Title"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        addSubview(titleLabel)
        
        // Layout with SnapKit
        setupConstraints()
    }
    
    private func setupConstraints() {
        leftButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
        }
        
        rightButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-16)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        self.snp.makeConstraints { make in
            make.height.equalTo(44)
        }
    }
    
    // MARK: - Button Actions
    @objc private func leftButtonTapped() {
        leftButtonAction?()
    }
    
    @objc private func rightButtonTapped() {
        rightButtonAction?()
    }
    
    // MARK: - Public Methods
    func setTitle(_ title: String) {
        titleLabel.text = title
    }
    
    func setLeftButtonTitle(_ title: String, action: @escaping () -> Void) {
        leftButton.setTitle(title, for: .normal)
        leftButtonAction = action
        leftButton.isHidden = false // 显示左侧按钮
    }
    
    func setRightButtonTitle(_ title: String, action: @escaping () -> Void) {
        rightButton.setTitle(title, for: .normal)
        rightButtonAction = action
    }
    
    func hideLeftButton() {
        leftButton.isHidden = true
    }
}
