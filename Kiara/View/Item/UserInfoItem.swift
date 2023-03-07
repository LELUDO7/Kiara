//
//  UserInfoView.swift
//  Kiara
//
//  Created by Ludovic Fournier on 2023-03-07.
//

import SwiftUI

struct UserInfoItem: View {
    @State var user : UserInfo
    
    var body: some View {
        HStack{
            Text(user.firstName)
            Text(user.lastName)
        }
    }
}


