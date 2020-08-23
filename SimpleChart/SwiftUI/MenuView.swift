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
        List(0..<10) {_ in
            HStack(spacing: 12) {
                Image(systemName: "person.circle")
                Text("Actvity")
            }
                
            
            .frame(height: 50)
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
