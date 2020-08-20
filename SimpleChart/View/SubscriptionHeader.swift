//
//  SubscriptionHeader.swift
//  SimpleChart
//
//  Created by Kenny Ho on 8/19/20.
//  Copyright © 2020 Kenny Ho. All rights reserved.
//

import UIKit

class SubscriptionHeader: UIView {
    let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Subscription Total"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    let totalCostLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        addSubview(headerLabel)
        headerLabel.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 8, paddingRight: 0, width: frame.width / 3, height: 0)
        
        addSubview(totalCostLabel)
        totalCostLabel.anchor(top: topAnchor, left: nil, bottom: bottomAnchor, right: rightAnchor, paddingTop: 8, paddingLeft: 0, paddingBottom: 8, paddingRight: 20, width: frame.width / 3, height: 0)
        
        let dividerLine = UIView()
        dividerLine.backgroundColor = .lightGray
        
        addSubview(dividerLine)
        dividerLine.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
