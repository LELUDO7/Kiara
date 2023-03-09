//
//  UserView.swift
//  Kiara
//
//  Created by Ludovic Fournier on 2023-02-21.
//

import SwiftUI

struct UserView: View {
    @AppStorage(KIARA.userKeys.userId) var userId: String = ""
    @AppStorage(KIARA.userKeys.firstName) var firstName: String = ""
    @AppStorage(KIARA.userKeys.lastName) var lastName: String = ""
    @AppStorage(KIARA.userKeys.pendingSendFriend) var pendingReciveFriend: [String] = []
    @AppStorage(KIARA.userKeys.pendingSendFriend) var pendingSendFriend: [String] = []
    
    @Binding var showSignInView : Bool
    
    var body: some View {
        VStack{
            Form{
                Text(firstName + " " + lastName)
                Button(STRING.LOG_OUT){
                    showSignInView = true
                    userId = ""
                    firstName = ""
                    lastName = ""
                    pendingSendFriend = []
                    pendingReciveFriend = []
                    KIARA.friends.removeAll()
                    KIARA.schedule.removeAll()
                    KIARA.loadScheduleTemplate()
                }
            }
            
        }
        
    }
}



//struct UserView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserView()
//    }
//}
