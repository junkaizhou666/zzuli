//
//  ButtonStackView.swift
//  zzuli
//
//  Created by 周俊凯 on 2024/12/4.
//

import UIKit

class ButtonStackView: UIStackView {
    
    init(buttons: [(image: UIImage?, title: String)]) {
        super.init(frame: .zero)
        
        // 设置StackView的属性，使按钮水平排列
        self.axis = .horizontal
        self.spacing = 10
        self.alignment = .center
        self.distribution = .fillEqually // 使每个按钮平分父视图的空间
        // 添加按钮
        for (image, title) in buttons.prefix(4) { // 只处理最多4个按钮
            let button = createButton(image: image, title: title)
            self.addArrangedSubview(button)
        }
        
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createButton(image: UIImage?, title: String) -> UIView {
        let buttonStack = UIStackView()
        buttonStack.axis = .vertical
        buttonStack.spacing = 5
        buttonStack.alignment = .center
        
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        
        buttonStack.addArrangedSubview(imageView)
        buttonStack.addArrangedSubview(titleLabel)
        
        return buttonStack
    }
}
