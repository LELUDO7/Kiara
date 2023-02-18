//
//  Course.swift
//  Kiara
//
//  Created by Ludovic Fournier on 2023-02-14.
//

import Foundation

public struct Course: Hashable, Identifiable{
    public var id: String{
        return StartHour + name
    }
    var StartHour:String
    var name:String
}
