//
//  UserInfo.swift
//  Kiara
//
//  Created by Ludovic Fournier on 2023-03-06.
//

import Foundation

public struct UserInfo: Identifiable {
    public var id: String{
        return idUser
    }
    let idUser : String
    let firstName : String
    let lastName : String
}
