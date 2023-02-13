//
//  ContentView.swift
//  Kiara
//
//  Created by Ludovic Fournier on 2023-01-31.
//

import SwiftUI
import UIKit

struct ContentView: View {
    var body: some View {
        
        
        TabView {
            
            
            WeekView().tabItem {
                Image(systemName: "calendar")
                Text("Week")
            }
            DayView().tabItem {
                Image(systemName: "calendar")
                Text("Day")
            }
            FriendsView().tabItem {
                Image(systemName: "person.2.fill")
                Text("Friends")
            }
            
            
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
