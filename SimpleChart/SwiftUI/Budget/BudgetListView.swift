//
//  BudgetListView.swift
//  SimpleChart
//
//  Created by Kenny Ho on 8/23/20.
//  Copyright © 2020 Kenny Ho. All rights reserved.
//

import SwiftUI

struct BudgetListView: View {
    
    @ObservedObject var viewModel = SubscriptionViewModel()
    @Binding var showMenu: Bool
    
    var body: some View {
        List {
            VStack {
                HStack {
                    Text("Overview")
                        .foregroundColor(Color("TextColor1"))
                    Spacer()
                    
                }
                .padding()
                
                ChartViewRepresentable()
                    .frame(width: screen.width, height: 300)
                
            }
            .background(Color("Background"))
            .listRowInsets(EdgeInsets())
            
            SubscriptionsSection(viewModel: viewModel)
                .background(Color("Background"))
        }
            
        .navigationBarTitle("Budget", displayMode: .inline)
        .navigationBarItems(leading:
            Button(action: {self.showMenu.toggle()}) {
                
                Image(systemName: "line.horizontal.3")
                    .resizable()
                    .frame(width: 16, height: 12)
                
            }, trailing:
            
            Button(action: {
                self.viewModel.append()
                
            }) {
                Image(systemName: "plus")
                    .resizable()
                    .frame(width: 14, height: 14)
        })
    }
}

struct BudgetListView_Previews: PreviewProvider {
    static var previews: some View {
        BudgetListView(showMenu: .constant(false))
    }
}
