//
//  Bloc.swift
//  Kiara
//
//  Created by Ludovic Fournier on 2023-02-10.
//

import Foundation

public class Bloc : Identifiable {
    var start: String
    var end: String
    init(start:String, end:String){
        self.start = start
        self.end = end
    }
}
