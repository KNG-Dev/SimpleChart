//
//  Menu.swift
//  SimpleChart
//
//  Created by Kenny Ho on 8/23/20.
//  Copyright © 2020 Kenny Ho. All rights reserved.
//

import Foundation

struct Menu: Identifiable {
    var id = UUID()
    let title: String
    let image: String
}

let accountMenu = [
    Menu(title: "Activity", image: "person.circle"),
    Menu(title: "Expenses", image: "calendar"),
    Menu(title: "Goals", image: "person.circle"),
    Menu(title: "Certificate of Deposit", image: "dollarsign.circle"),
]

let settingMenu = [
    Menu(title: "Support", image: "message"),
    Menu(title: "Personal Info", image: "person.circle"),
    Menu(title: "Account Details", image: "house"),
    Menu(title: "App Settings", image: "gear"),
]
