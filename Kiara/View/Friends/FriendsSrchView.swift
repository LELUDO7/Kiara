//
//  FriendsSrch.swift
//  Kiara
//
//  Created by Ludovic Fournier on 2023-03-07.
//

import SwiftUI

struct FriendsSrchView: View {
    @State private var srch: String = ""
    @State private var userInfoList = FRIENDS.currentResearchOfUser
    
    @Binding var showThisView : Bool
    
    var body: some View {
        NavigationStack{
                List(userInfoList) { user in
                        UserInfoItem(user: user)
                }
                .navigationTitle("Add friend")
                .listStyle(.plain)
                .toolbar{
                    Button{
                        showThisView = false
                    } label: {
                        Text("Close")
                    }
                }

        }
        .searchable(text: $srch){
            
        }
        .onChange(of: srch) { newValue in
            API.getAllUserInfo(searchContent: srch ,completion: { response in
                if(response)
                {
                    userInfoList.removeAll()
                    userInfoList = FRIENDS.currentResearchOfUser
                }
            })
        }
        
        
        
    }
}


