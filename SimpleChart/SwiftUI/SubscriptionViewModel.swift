//
//  SubscriptionStore.swift
//  SimpleChart
//
//  Created by Kenny Ho on 8/22/20.
//  Copyright © 2020 Kenny Ho. All rights reserved.
//

import SwiftUI
import Combine

struct Item: Identifiable {
       var id = UUID()
       var title: String
       var price: Double
       var image: String
   }

class SubscriptionViewModel: ObservableObject {
    @Published var subscriptions: [Item] = subscriptionData
    
}

var subscriptionData = [
    Item(title: "Netflix", price: 12.99, image: "NetflixLogo"),
    Item(title: "Spotify Plus", price: 9.99, image: "SpotifyLogo"),
    Item(title: "Disney Plus", price: 6.99, image: "DisneyPlusLogo")
]
