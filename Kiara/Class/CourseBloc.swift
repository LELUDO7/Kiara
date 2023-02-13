//
//  CourseBloc.swift
//  Kiara
//
//  Created by Ludovic Fournier on 2023-02-10.
//

import Foundation
import SwiftUI

public class CourseBloc: Bloc {
    var name:String
    var local:String
    var nbBloc:Int
    var color: UIColor
    init(start: String, end: String, name:String, local:String, color: UIColor, nbBloc:Int) {
        self.name = name
        self.nbBloc = nbBloc
        self.color = color
        self.local = local
        super.init(start: start, end: end)
    }
}
