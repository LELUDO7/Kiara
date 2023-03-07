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
        KIARA.loadSchedule()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

public let TOOLS = Tools()

public let STRING = StringLocal()

public let KIARA = Kiara()

public let FRIENDS = Kiara_Friends()

public let API = KiaraAPI()

