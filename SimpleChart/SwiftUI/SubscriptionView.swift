//
//  SubscriptionView.swift
//  SimpleChart
//
//  Created by Kenny Ho on 8/23/20.
//  Copyright © 2020 Kenny Ho. All rights reserved.
//

import SwiftUI

struct SubscriptionView: View {
    @ObservedObject var viewModel = SubscriptionViewModel()
    
    var body: some View {
        ForEach(viewModel.subscriptions) { item in
            HStack {
                Image(item.image)
                    .resizable()
                    .frame(width: 44, height: 44)
                    .cornerRadius(8)
                    .aspectRatio(contentMode: .fit)
                
                Text(item.title)
                    .font(.system(size: 20, weight: .light))
                    .padding(.leading, 4)
                
                Spacer()
                
                Text("\(item.price, specifier: "%.2f") / Month")
                    .font(.system(size: 18, weight: .light))
            }
                
            .padding(.leading)
            .padding(.trailing)
            .frame(height: 70)
        }
            
        .onDelete(perform: { index in
            self.viewModel.subscriptions.remove(at: index.first!)
            
        })
    }
}

struct SubscriptionView_Previews: PreviewProvider {
    static var previews: some View {
        SubscriptionView()
    }
}
