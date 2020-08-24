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
                Image(systemName: self.dark ? "moon.fill" : "sun.max.fill")
                Text(self.dark ? "Dark Mode" : "Light Mode")
                Spacer()
                
                Button(action: { self.toggleDarkMode() }) {
                    Text("Click Me")
                        .foregroundColor(Color.blue)
                }
            }
                
            .listRowBackground(Color("SlideMenuColor"))
            .frame(height: 50)
            
            CustomDividerLineView(dark: $dark)
            MenuAccountSection()
            CustomDividerLineView(dark: $dark)
            MenuSettingSection()
            
        }.environment(\.defaultMinListRowHeight, 1)
          
        .onAppear(perform: {
            UITableView.appearance().separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            UITableView.appearance().backgroundColor = UIColor(named: "SlideMenuColor")
            
        })
    }
    
    fileprivate func toggleDarkMode() {
        dark.toggle()
        UIApplication.shared.windows.first?.rootViewController?.view.overrideUserInterfaceStyle = self.dark ? .dark : .light
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
        .environment(\.colorScheme, .dark)
    }
}

struct MenuAccountSection: View {
    var body: some View {
        ForEach(accountMenu) { item in
            HStack(spacing: 12) {
                Image(systemName: item.image)
                Text(item.title)
            }
            .frame(height: 50)
            
        }.listRowBackground(Color("SlideMenuColor"))
    }
}

struct MenuSettingSection: View {
    var body: some View {
        ForEach(settingMenu) { item in
            HStack(spacing: 12) {
                Image(systemName: item.image)
                Text(item.title)
            }
            .frame(height: 50)
            
            //Sets the backgroundColor for section
        }.listRowBackground(Color("SlideMenuColor"))
    }
}

struct CustomDividerLineView: View {
    @Binding var dark: Bool
    
    var body: some View {
        Rectangle()
            .frame(height: 4)
            .foregroundColor(Color(dark ? .black : .systemGray3))
            .listRowInsets(EdgeInsets())
    }
}
