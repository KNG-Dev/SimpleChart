//
//  AddSubscriptionController.swift
//  SimpleChart
//
//  Created by Kenny Ho on 8/20/20.
//  Copyright © 2020 Kenny Ho. All rights reserved.
//

import UIKit

protocol AddSubscriptionControllerDelegate: class {
    func addSubscription(subscription: Subscription)
}

class AddSubscriptionController: UITableViewController, UITextFieldDelegate {
    
    let cellId = "cellId"
    
    @IBOutlet weak var subscriptionTextField: UITextField!
    @IBOutlet weak var subscriptionPriceTextField: UITextField!
    
    weak var delegate: AddSubscriptionControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(addSubscription))
    }
    
    @objc fileprivate func addSubscription() {
        print("Adding subscription")
        let subscriptionTitle = subscriptionTextField.text ?? ""
        let subscriptionPrice = Double(subscriptionPriceTextField.text ?? "0.00") ?? 0.00
        let subscription = Subscription(name: subscriptionTitle, price: subscriptionPrice, image: "SimpleLogo")
        delegate?.addSubscription(subscription: subscription)
        navigationController?.popViewController(animated: true)
    }
}
