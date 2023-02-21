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
        loadScheduleTemplate(establishmentNameId: 0)
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}



let textFontSize = CGFloat(12)
let blocHeight = CGFloat(20)
let blocWidth = CGFloat(20)
let dayTextFontSize = CGFloat(17)
let courseOpacity = 0.8

let userDefaults = UserDefaults.standard

public let STRING = StringLocal()

public var weekCourseBlocs = [[Bloc]]()

public func loadScheduleTemplate(establishmentNameId:Int){
    weekCourseBlocs.append(cstjTemplate)
    for _ in 1...5{
        weekCourseBlocs.append(cstjTemplate)
    }
}

private var cstjTemplate: [Bloc] = [
    EmptyBloc(start: "08:00",end: "08:50", display: true),
    EmptyBloc(start: "08:55",end: "09:45", display: true),
    EmptyBloc(start: "09:50",end: "10:40", display: true),
    EmptyBloc(start: "10:45",end: "11:35", display: true),
    EmptyBloc(start: "11:40",end: "12:30", display: true),
    EmptyBloc(start: "12:35",end: "14:20", display: true),
    EmptyBloc(start: "13:30",end: "14:20", display: true),
    EmptyBloc(start: "14:25",end: "15:15", display: true),
    EmptyBloc(start: "15:20",end: "16:10", display: true),
    EmptyBloc(start: "16:15",end: "17:05", display: true),
    EmptyBloc(start: "17:10",end: "18:00", display: true)
]
private let cstjTimesBlocs: [TimeBloc] = [
    TimeBloc(start: "08:00",end: "08:50"),
    TimeBloc(start: "08:55",end: "09:45"),
    TimeBloc(start: "09:50",end: "10:40"),
    TimeBloc(start: "10:45",end: "11:35"),
    TimeBloc(start: "11:40",end: "12:30"),
    TimeBloc(start: "12:35",end: "13:25"),
    TimeBloc(start: "13:30",end: "14:20"),
    TimeBloc(start: "14:25",end: "15:15"),
    TimeBloc(start: "15:20",end: "16:10"),
    TimeBloc(start: "16:15",end: "17:05"),
    TimeBloc(start: "17:10",end: "18:00")
]
