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

public let FRIENDS = Friends()

public let API = KiaraAPI()

extension Array: RawRepresentable where Element: Codable {
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8),
              let result = try? JSONDecoder().decode([Element].self, from: data)
        else {
            return nil
        }
        self = result
    }

    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
              let result = String(data: data, encoding: .utf8)
        else {
            return "[]"
        }
        return result
    }
}

