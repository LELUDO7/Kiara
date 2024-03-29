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
    
    @State var APIOK = false
    @State var showSignInView = true
    @State var userLoadAndSave = false
 
    private var isSignedIn: Bool{
        userId.isEmpty
    }
    
    var body: some View {
        ZStack{
            if showSignInView
            {
                SignInView(showSignInView: $showSignInView, APIOK: $APIOK).task {
                    showSignInView = isSignedIn
                }
            }else{
                TabView {
                    
                    if userLoadAndSave{
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
                        UserView(showSignInView: $showSignInView).tabItem {
                            Image(systemName: "person.fill")
                            Text("User")
                        }
                    }
                    
                }.task {
                    API.getUser(userId: self.userId, completion: {_ in
                        KIARA.saveSchedule()
                        userLoadAndSave = true
                    })
                }
                
            }
        }.task {
            API.checkAPI{ success in
                if success{
                    APIOK = true
                }
                else
                {
                    userLoadAndSave = true
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
