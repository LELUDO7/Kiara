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
    var body: some View {
        Text(firstName + " " + lastName)
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
