//
//  Day.swift
//  Kiara
//
//  Created by Ludovic Fournier on 2023-02-14.
//

import Foundation

public func getDayId() -> Int
{
    let dayOfWeek = Calendar.current.component(.weekday, from: Date())-1
    if(dayOfWeek >= 6)
    {
        return 1
    }
    return dayOfWeek
}

public func getDayName() -> String
{
    let dayOfWeek = Calendar.current.component(.weekday, from: Date())-1
    switch dayOfWeek{
    case 1:
        return STRING.MONDAY_S
    case 2:
        return STRING.TUESDAY_S
    case 3:
        return STRING.WEDNESDAY_S
    case 4:
        return STRING.THURSDAY_S
    case 5:
        return STRING.FRIDAY_S
    default :
        return STRING.MONDAY_S
    }
}
