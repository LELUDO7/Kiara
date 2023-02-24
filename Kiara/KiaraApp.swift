//
//  KiaraApp.swift
//  Kiara
//
//  Created by Ludovic Fournier on 2023-01-31.
//

import SwiftUI
import Foundation


@main
struct KiaraApp: App {
    init() {
        KIARA.loadScheduleTemplate()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

public let API = KiaraAPI()

public let STRING = StringLocal()

public let KIARA = Kiara()

