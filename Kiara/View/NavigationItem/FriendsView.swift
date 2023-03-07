//
//  FriendsView.swift
//  Kiara
//
//  Created by Ludovic Fournier on 2023-02-11.
//

import SwiftUI

struct FriendsView: View {
    @State var showFriendsSrch = false
    var body: some View {
        NavigationStack {
            HStack{
                
            }
            .navigationTitle(STRING.FRIENDS_S)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {

                    Button{
                        showFriendsSrch = true
                    } label: {
                        Image(systemName: "person.fill.badge.plus")
                    }
                    .sheet(isPresented: $showFriendsSrch,content:  {
                        FriendsSrchView(showThisView: $showFriendsSrch)
                            })
                }
            }
        }
        
        
    }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
    }
}
