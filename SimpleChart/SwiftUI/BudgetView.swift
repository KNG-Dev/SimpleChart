//
//  BudgetView.swift
//  SimpleChart
//
//  Created by Kenny Ho on 8/21/20.
//  Copyright © 2020 Kenny Ho. All rights reserved.
//

import SwiftUI

let screen = UIScreen.main.bounds

struct BudgetView: View {
    var store = SubscriptionViewModel()
    @State var showPresent = false
    
    //Custom Initializers
    init() {
        setupNavBar()
    }
    
    var body: some View {
        NavigationView {
            List {
                VStack {
                    HStack {
                        Text("Overview")
                            .foregroundColor(Color("TextColor1"))
                        Spacer()
                        Text("•••")
                            .foregroundColor(Color(.lightGray))
                    }
                    .padding()
                    
                    ChartViewRepresentable()
                        .frame(width: screen.width, height: 300)
                    
                }
                .background(Color("Background"))
                .listRowInsets(EdgeInsets())
                
                SubscriptionsSection(store: self.store)
                    .background(Color("Background"))
            }
                
            .navigationBarTitle("Budget", displayMode: .inline)
            .navigationBarItems(leading:
                NavigationLink(destination: Text("ThirdView")) {
                    Image(systemName: "line.horizontal.3")
                        .resizable()
                        .frame(width: 16, height: 12)
                    
                }, trailing:
                
                Button(action: {self.addUpdate()}) {
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 14, height: 14)
            })
        }
    }
    
    func addUpdate() {
        print("Adding item")
        let newSubscription = Item(title: "Simple", price: 9.99, image: "SimpleLogo")
        store.subscriptions.append(newSubscription)
    }
    
    fileprivate func setupNavBar() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = UIColor(named: "NavBar")
        navBarAppearance.titleTextAttributes = [.foregroundColor : UIColor(named: "Color2") ?? Color.blue]
        UINavigationBar.appearance().standardAppearance = navBarAppearance
    }
}

struct BudgetView_Previews: PreviewProvider {
    static var previews: some View {
        BudgetView()
            .environment(\.colorScheme, .dark)
    }
}

struct SubscriptionsSection: View {
    @State var store: SubscriptionViewModel
    
    var body: some View {
        Section(header:
            //Header
            VStack(spacing: 0) {
                HStack {
                    Text("Subscription Total")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(Color.primary)
                    
                    Spacer()
                    
                    //reduce function takes sum of all prices in array
                    Text("$\(store.subscriptions.map({$0.price}).reduce(0, +), specifier: "%.2f") / Month")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(Color.primary)
                }
                    
                .padding(.leading)
                .padding(.trailing)
                .frame(height: 80)
                .background(Color("Background"))
                
                Divider()
                    .foregroundColor(Color(.systemGray))
                
        }) {
            
            SubscriptionView(store: store)
        }
        .listRowInsets(EdgeInsets())
    }
}

struct ChartViewRepresentable: UIViewRepresentable {
    typealias UIViewType = ChartView
    
    func makeUIView(context: Context) -> ChartView {
        let chartView = ChartView()
        return chartView
    }
    
    func updateUIView(_ uiView: ChartView, context: Context) {
    }
}

