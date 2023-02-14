//
//  Day.swift
//  Kiara
//
//  Created by Ludovic Fournier on 2023-02-11.
//

import Foundation

public class Day:Identifiable{
    public let name:String
    public let array:[Bloc]
    
    init(name: String, array:[Bloc]) {
        self.name = name
        self.array = array
    }
}
