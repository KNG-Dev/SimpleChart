//
//  SubscriptionCell.swift
//  SimpleChart
//
//  Created by Kenny Ho on 8/19/20.
//  Copyright © 2020 Kenny Ho. All rights reserved.
//

import UIKit

class SubscriptionCell: UITableViewCell {
    
    var subscription: Subscription! {
        didSet {
            subscriptionLabel.text = subscription.name
            subscriptionPriceLabel.text = "\(subscription.price.rounded()) / Month"
            subscriptionImageView.image = UIImage(named: subscription.image)
        }
    }
    
    let subscriptionImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 6
        imageView.backgroundColor = .red
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let subscriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22)
        return label
    }()
    
    let subscriptionPriceLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .right
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(subscriptionImageView)
        subscriptionImageView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 9, paddingLeft: 16, paddingBottom: 9, paddingRight: 0, width: 48, height: 0)
        
        addSubview(subscriptionLabel)
        subscriptionLabel.anchor(top: topAnchor, left: subscriptionImageView.rightAnchor, bottom: bottomAnchor, right: nil, paddingTop: 8, paddingLeft: 12, paddingBottom: 8, paddingRight: 0, width: 200, height: 0)
        
        addSubview(subscriptionPriceLabel)
        subscriptionPriceLabel.anchor(top: topAnchor, left: nil, bottom: bottomAnchor, right: rightAnchor, paddingTop: 8, paddingLeft: 0, paddingBottom: 8, paddingRight: 20, width: 200, height: 0)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
