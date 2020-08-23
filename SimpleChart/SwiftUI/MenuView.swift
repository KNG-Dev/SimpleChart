//
//  MenuView.swift
//  SimpleChart
//
//  Created by Kenny Ho on 8/23/20.
//  Copyright © 2020 Kenny Ho. All rights reserved.
//

import SwiftUI

struct MenuView: View {
    init() {
//        UITableView.appearance().separatorStyle = .none
    }
    
    var body: some View {
        List(menu) {item in
            HStack(spacing: 12) {
                Image(systemName: item.image)
                Text(item.title)
            }
                
            
            .frame(height: 50)
        }
    }
}

struct Menu: Identifiable {
    var id = UUID()
    let title: String
    let image: String
}

let menu = [
    Menu(title: "Activity", image: "person.circle"),
    Menu(title: "Expenses", image: "calendar"),
    Menu(title: "Goals", image: "person.circle"),
    Menu(title: "Certificate of Deposit", image: "dollarsign.circle"),
    Menu(title: "Support", image: "message"),
    Menu(title: "Personal Info", image: "person.circle"),
    Menu(title: "Account Details", image: "house"),
    Menu(title: "App Settings", image: "gear"),
]

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
