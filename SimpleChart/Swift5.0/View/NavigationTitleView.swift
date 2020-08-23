//
//  NavigationTitleView.swift
//  SimpleChart
//
//  Created by Kenny Ho on 8/20/20.
//  Copyright © 2020 Kenny Ho. All rights reserved.
//

import UIKit

class NavigationTitleView: UIView {
    let navigationTitle: UILabel = {
        let label = UILabel()
        label.text = "Budget Overview"
        label.textColor = .systemBlue
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(navigationTitle)
        navigationTitle.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
