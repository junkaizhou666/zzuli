//
//  ButtonStackView.swift
//  zzuli
//
//  Created by 周俊凯 on 2024/12/4.
//

import UIKit

class ButtonStackView: UIStackView {
    
    init(buttons: [(image: UIImage?, buttonTitle: String)], labelTitle: String? = nil) {
        super.init(frame: .zero)
        
        // 设置StackView的属性，按钮垂直排列
        self.axis = .vertical
        self.spacing = 10
        self.alignment = .fill  // 设置视图内子视图的对齐方式为填充，意味着子视图将被拉伸以填充父视图的空间。
        self.distribution = .fillEqually  // 设置子视图的分布方式为均等填充，意味着所有子视图的大小会相同，填满父视图的整个可用空间。

        
        // 添加标题（如果有）
        if let titleText = labelTitle {
            let titleLabel = UILabel()
            titleLabel.text = titleText
            titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
            titleLabel.textAlignment = .center
            
            let separator = UIView()
            separator.backgroundColor = .gray // 分割线颜色
            separator.translatesAutoresizingMaskIntoConstraints = false
            separator.heightAnchor.constraint(equalToConstant: 1).isActive = true
            
            // 添加标题和分割线
            self.addArrangedSubview(titleLabel)
            self.addArrangedSubview(separator)
        }
        
        // 创建按钮行
        var currentRowStack: UIStackView?
        var buttonsInRow: [UIButton] = []
        
        for (index, (image, buttonTitle)) in buttons.prefix(12).enumerated() { // 处理最多12个按钮（3行×4个按钮）
            let button = createButton(image: image, buttonTitle: buttonTitle)
            buttonsInRow.append(button)
            
            // 每4个按钮添加一行
            if (index + 1) % 4 == 0 || (index + 1) == buttons.count {
                currentRowStack = createRowStack(buttons: buttonsInRow)
                self.addArrangedSubview(currentRowStack!)
                buttonsInRow.removeAll()
            }
        }
        
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func createButton(image: UIImage?, buttonTitle: String) -> UIButton {
        let button = UIButton(type: .custom)
        
        var configuration = UIButton.Configuration.filled()
        configuration.background.backgroundColor = .clear // 清除背景颜色
        
        if let image = image {
            configuration.image = image
        }
        configuration.title = buttonTitle
        
        configuration.imagePlacement = .top
        configuration.imagePadding = 5
        
        var titleAttributes = AttributeContainer()
        titleAttributes.font = UIFont.systemFont(ofSize: 14)
        titleAttributes.foregroundColor = UIColor.black
        configuration.attributedTitle = AttributedString(buttonTitle, attributes: titleAttributes)
        
        button.configuration = configuration
        
        button.translatesAutoresizingMaskIntoConstraints = false
        //button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        //button.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        return button
    }
    
    // 创建按钮行
    private func createRowStack(buttons: [UIView]) -> UIStackView {
        let rowStack = UIStackView(arrangedSubviews: buttons)
        rowStack.axis = .horizontal
        rowStack.spacing = 10
        rowStack.alignment = .center
        rowStack.distribution = .fillEqually
        return rowStack
    }
}
