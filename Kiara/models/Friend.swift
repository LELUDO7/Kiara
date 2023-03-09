//
//  Friend.swift
//  Kiara
//
//  Created by Ludovic Fournier on 2023-03-09.
//

import Foundation

public struct Friend : Identifiable {
    public var id: String{
        return friendId
    }
    let friendId: String
    let firstName:String
    let lastName:String 
    var schedule: [[Bloc]]
}
