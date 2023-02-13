//
//  KiaraApp.swift
//  Kiara
//
//  Created by Ludovic Fournier on 2023-01-31.
//

import SwiftUI
import Foundation

public let timesBlocs: [TimeBloc] = [
    TimeBloc(start: "08:00",end: "08:50", blocId: 0),
    TimeBloc(start: "08:55",end: "09:45", blocId: 1),
    TimeBloc(start: "09:50",end: "10:40", blocId: 2),
    TimeBloc(start: "10:45",end: "11:35", blocId: 3),
    TimeBloc(start: "11:40",end: "12:30", blocId: 4),
    TimeBloc(start: "12:35",end: "13:25", blocId: 5),
    TimeBloc(start: "13:30",end: "14:20", blocId: 6),
    TimeBloc(start: "14:25",end: "15:15", blocId: 7),
    TimeBloc(start: "15:20",end: "16:10", blocId: 8),
    TimeBloc(start: "16:15",end: "17:05", blocId: 9),
    TimeBloc(start: "17:10",end: "18:00", blocId: 10)
]

public var coursesBlocsMonday: [Bloc] = [
    CourseBloc(start: "08:00",end: "08:50", name:"Français", local:"K205",color: .systemYellow, nbBloc: 1),
    EmptyBloc(start: "08:55",end: "09:45",display: false),
    EmptyBloc(start: "09:50",end: "10:40",display: true),
    CourseBloc(start: "10:45",end: "11:35", name:"Photo", local:"A414",color: .systemPurple, nbBloc: 1),
    EmptyBloc(start: "11:40",end: "12:30",display: false),
    CourseBloc(start: "12:35",end: "14:20", name:"Maths", local:"D115",color: .systemGreen, nbBloc: 2),
    EmptyBloc(start: "13:30",end: "14:20",display: false),
    EmptyBloc(start: "14:25",end: "15:15",display: false),
    CourseBloc(start: "15:20",end: "16:10", name:"Philo", local:"C256",color: .systemRed, nbBloc: 0),
    EmptyBloc(start: "16:15",end: "17:05",display: true),
    EmptyBloc(start: "17:10",end: "18:00",display: true)
]
public var coursesBlocsTuesday: [Bloc] = [
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

public var coursesBlocsWednesday: [Bloc] = [
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

public var coursesBlocsThursday: [Bloc] = [
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

public var coursesBlocsFriday: [Bloc] = [
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

public var WeekDays:[Day]=[
    Day(name: "Monday", array:coursesBlocsMonday ),
    Day(name: "Tuesday", array: coursesBlocsTuesday),
    Day(name: "Wednesday", array: coursesBlocsWednesday),
    Day(name: "Thursday", array: coursesBlocsThursday),
    Day(name: "Fryday", array: coursesBlocsFriday)
]

@main
struct KiaraApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
            
            
        }
    }
}
