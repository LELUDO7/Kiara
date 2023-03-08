//
//  UserInfoView.swift
//  Kiara
//
//  Created by Ludovic Fournier on 2023-03-07.
//

import SwiftUI

struct UserInfoItem: View {
    @State var user : UserInfo
    @State var send = false
    
    var body: some View {
        HStack{
            Text(user.firstName)
            Text(user.lastName)
            
            Spacer()
            
            if !send {
                Button{
                    FRIENDS.SendFriendRequest(friend: user)
                    send = true
                }label: {
                    Text("Add")
                }
                .buttonStyle(.borderedProminent)
            }
            
            
        }
        .task {
            FRIENDS.sendFriendRequest.forEach{ friendId in
                if user.idUser == friendId
                {
                    send = true
                }
            }
        }
    }
}


