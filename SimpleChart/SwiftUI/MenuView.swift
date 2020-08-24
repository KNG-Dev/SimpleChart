//
//  MenuView.swift
//  SimpleChart
//
//  Created by Kenny Ho on 8/23/20.
//  Copyright © 2020 Kenny Ho. All rights reserved.
//

import SwiftUI

struct MenuView: View {
    @State var dark = false
    
    
    
    var body: some View {
        List {
            
            
            HStack {
                Image(systemName: "person.circle")
                Text("Dark Mode")
                Spacer()
                
                Button(action: { self.toggleDarkMode() }) {
                    Text("Click Me")
                        .foregroundColor(Color.blue)
                }
            }
            
            .frame(height: 50)
 
            ForEach(accountMenu) { item in
                HStack(spacing: 12) {
                    Image(systemName: item.image)
                    Text(item.title)
                }
                .frame(height: 50)
            }
            .listRowBackground(Color("SlideMenuColor"))
            
            Rectangle()
                .foregroundColor(Color(.clear))
                .frame(height: 1)
                
            
            ForEach(settingMenu) { item in
                HStack(spacing: 12) {
                    Image(systemName: item.image)
                    Text(item.title)
                }
                .frame(height: 50)
            }
            
            .listRowBackground(Color("SlideMenuColor"))
            
        }
        
        .environment(\.defaultMinListRowHeight, 1)
            
        .onAppear(perform: {
            UITableView.appearance().separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            UITableView.appearance().backgroundColor = UIColor(named: "SlideMenuColor")
            
        })
        
        
        
    }
    
    func toggleDarkMode() {
        dark.toggle()
        UIApplication.shared.windows.first?.rootViewController?.view.overrideUserInterfaceStyle = self.dark ? .dark : .light
    }
}

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

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
        .environment(\.colorScheme, .dark)
    }
}
