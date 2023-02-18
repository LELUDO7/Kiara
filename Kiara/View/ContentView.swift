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
                Text(STRING.WEEK_S)
            }
            TodayView().tabItem {
                Image(systemName: "calendar")
                Text(STRING.TODAY_S)
            }
            FriendsView().tabItem {
                Image(systemName: "person.2.fill")
                Text(STRING.FRIENDS_S)
            }
            
            
        }.task {
            await getData(from: url)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
