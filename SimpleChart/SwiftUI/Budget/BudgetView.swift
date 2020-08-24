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
    var viewModel = SubscriptionViewModel()
    @State var showMenu = false
    
    init() {
        setupNavBar()
        UITableView.appearance().backgroundColor = UIColor(named: "Background")
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            NavigationView {
                BudgetListView(viewModel: viewModel, showMenu: $showMenu)
            }
            
            //This is the background when MenuView is present
            Color(.black).opacity(0.3)
                .edgesIgnoringSafeArea(.all)
                .opacity(self.showMenu ? 1 : 0)
                .animation(.easeIn(duration: 0.3))
                .onTapGesture {
                    self.showMenu.toggle()
            }
            
            MenuView()
                .frame(width: screen.width / 1.5)
                .overlay(Rectangle().stroke(Color.primary.opacity(0.2), lineWidth: 2).shadow(radius: 3).edgesIgnoringSafeArea(.all))
                .offset(x: self.showMenu ? 0 : -screen.width / 1.5)
                .animation(.easeOut(duration: 0.3))
                
        }
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
//            .environment(\.colorScheme, .dark)
    }
}

struct SubscriptionsSection: View {
    @ObservedObject var viewModel = SubscriptionViewModel()
    
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
                    Text("$\(viewModel.subscriptions.map({$0.price}).reduce(0, +), specifier: "%.2f") / Month")
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
            
            SubscriptionView(viewModel: viewModel)
        }
        .listRowInsets(EdgeInsets())
    }
}

//MARK: - ChartView Representable
//Needed to show custom UIView
struct ChartViewRepresentable: UIViewRepresentable {
    typealias UIViewType = ChartView
    
    func makeUIView(context: Context) -> ChartView {
        let chartView = ChartView()
        return chartView
    }
    
    func updateUIView(_ uiView: ChartView, context: Context) {
        
    }
}





