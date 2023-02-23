//
//  UserView.swift
//  Kiara
//
//  Created by Ludovic Fournier on 2023-02-21.
//

import SwiftUI

struct UserView: View {
    @AppStorage("userId") var userId: String = ""
    @AppStorage("firstName") var firstName: String = ""
    @AppStorage("lastName") var lastName: String = ""
    
    @Binding var showSignInView : Bool
    
    var body: some View {
        VStack{
            Form{
                Text(firstName + " " + lastName)
                Button("Log Out"){
                    showSignInView = true
                    userId = ""
                    firstName = ""
                    lastName = ""
                    loadScheduleTemplate(establishmentNameId: 1)
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
