//
//  TimeBloc.swift
//  Kiara
//
//  Created by Ludovic Fournier on 2023-02-10.
//

import Foundation

public class TimeBloc: Bloc {
    var blocId: Int
    init(start: String, end: String, blocId:Int) {
        self.blocId = blocId
        super.init(start: start, end: end)
    }
}
