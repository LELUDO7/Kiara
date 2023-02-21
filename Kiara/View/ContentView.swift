//
//  ContentView.swift
//  Kiara
//
//  Created by Ludovic Fournier on 2023-01-31.
//

import SwiftUI
import UIKit



struct ContentView: View {
    @AppStorage("userId") var userId: String = ""
    
    @State var showSignInView = true
 
    private var isSignedIn: Bool{
        userId.isEmpty
    }
    
    var body: some View {
        
        if showSignInView
        {
            SignInView(showSignInView: $showSignInView).task {
                showSignInView = isSignedIn
            }
        }else{
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
                UserView().tabItem {
                    Image(systemName: "person.fill")
                    Text("User")
                }
        }
            
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
