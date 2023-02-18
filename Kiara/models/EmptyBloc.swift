//
//  EmptyBloc.swift
//  Kiara
//
//  Created by Ludovic Fournier on 2023-02-11.
//

import Foundation

public class EmptyBloc: Bloc {
    var display: Bool
    init(start: String, end: String, display:Bool) {
        self.display = display
        super.init(start: start, end: end)
    }
    
}
