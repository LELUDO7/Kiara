//
//  CourseEditor.swift
//  Kiara
//
//  Created by Ludovic Fournier on 2023-02-11.
//

import Foundation
import SwiftUI

public var editorErrorMessage:String = ""

public func addCourse(name:String, local:String, color:UIColor, start:String, end:String, selectedDay:Int) -> Bool
{
    if(name == "")
    {
        editorErrorMessage = "Enter a name"
        return true
    }
    else if(selectedDay == 0 )
    {
        editorErrorMessage = "Select a day"
        return true
    }
    else if(start == "Select course start hour")
    {
        editorErrorMessage = start
        return true
    }
    else if(end == "Select course end hour")
    {
        editorErrorMessage = end
        return true
    }
    weekCourseBlocs[selectedDay][getBlocId(start: start)] = CourseBloc(start: start, end: end, name: name, local: local, color: color, nbBloc: 0)
    resetStartHours()
    resetEndHours()
    return false
}

private func getBlocId(start:String) -> Int
{
    var i = 0
    for bloc in weekCourseBlocs[0]
    {
        if(bloc.start == start)
        {
            return i
        }
        i+=1
    }
    return -1
}

private func getBlocId(end:String) -> Int
{
    var i = 0
    for bloc in weekCourseBlocs[0]
    {
        if(bloc.end == end)
        {
            return i
        }
        i+=1
    }
    return -1
}

public var BlocColors = [UIColor.systemYellow, UIColor.systemRed,UIColor.systemBlue, UIColor.systemCyan,UIColor.systemPink,UIColor.systemPurple,UIColor.systemOrange, UIColor.systemGreen,UIColor.systemBlue,UIColor.systemCyan]

extension UIColor {
    var name: String? {
        switch self {
        case UIColor.systemGray : return "gray"
        case UIColor.systemRed: return "red"
        case UIColor.systemGreen: return "green"
        case UIColor.systemBlue: return "blue"
        case UIColor.systemCyan: return "cyan"
        case UIColor.systemYellow: return "yellow"
        case UIColor.systemOrange: return "orange"
        case UIColor.systemPink: return "pink"
        case UIColor.systemPurple: return "purple"
        case UIColor.systemBrown: return "brown"
        default: return nil
        }
    }
}

public var WeekDaysNamePicker = [
    WeekDay(dayId: 0, name:"Select a day"),
    WeekDay(dayId: 1, name:"monday"),
    WeekDay(dayId:2, name:"tuesday"),
    WeekDay(dayId:3, name:"wednesday"),
    WeekDay(dayId:4, name:"thursday"),
    WeekDay(dayId:5, name:"friday")]

public struct WeekDay: Hashable, Identifiable{
    public var id: Int{
        return dayId
    }
    var dayId:Int
    var name:String
}


public var StartHours = ["Select course start hour"]
public var EndHours = ["Select course end hour"]

public func SetStartHours(selectedDay:Int){
    resetStartHours()
    if(selectedDay == 0){ return }
    
    for bloc in weekCourseBlocs[selectedDay]{
        if let emptyBloc = bloc as? EmptyBloc{
            if(emptyBloc.display){
                StartHours.append(emptyBloc.start)
            }
        }
    }
    
}

public func SetEndHours(selectedDay:Int){
    
    resetEndHours()
    if(selectedDay == 0){ return }
    
    for bloc in weekCourseBlocs[selectedDay]{
        if let emptyBloc = bloc as? EmptyBloc{
            if(emptyBloc.display){
                EndHours.append(emptyBloc.end)
            }
        }
    }
}

public func resetColor(){

}

public func resetStartHours(){
    StartHours.removeAll()
    StartHours.append("Select course start hour")
}

public func resetEndHours(){
    EndHours.removeAll()
    EndHours.append("Select course end hour")
}

