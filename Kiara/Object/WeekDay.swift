//
//  WeekDay.swift
//  Kiara
//
//  Created by Ludovic Fournier on 2023-02-14.
//

import Foundation

public struct WeekDay: Hashable, Identifiable{
    public var id: Int{
        return dayId
    }
    var dayId:Int
    var name:String
}
