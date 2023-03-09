//
//  FriendsView.swift
//  Kiara
//
//  Created by Ludovic Fournier on 2023-02-11.
//

import SwiftUI

struct FriendsView: View {
    @State var showFriendsSrch = false
    @State var friends = FRIENDS.friends
    var body: some View {
        NavigationStack {
            VStack{
                Text("My friends")
                List(friends) { friend in
                    NavigationLink {
                        FriendScheduleView(friend: friend, schedule: friend.schedule)
                    } label: {
                        HStack{
                            Text(friend.firstName)
                            Text(friend.lastName)
                        }
                    }
                }
                .listStyle(.plain)
                Spacer()
                Text("Friend resquest")
                List {
                    NavigationLink("Send friend request",destination: SendFriendRequestView())
                    NavigationLink("Receive friend request",destination: ReceiveFriendRequestView())
                }
                .listStyle(.plain)
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
        .task {
            FRIENDS.friends.removeAll()
            for friend in KIARA.friends{
                API.getFriend(friendId: friend, completion: { done in
                    friends = FRIENDS.friends
                })
            }
        }
        
        
    }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
    }
}
