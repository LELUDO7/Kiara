//
//  CourseEditor.swift
//  Kiara
//
//  Created by Ludovic Fournier on 2023-02-11.
//

import Foundation
import SwiftUI

public var editorErrorMessage:String = ""
public var StartHours = [STRING.NA_S]
public var EndHours = [STRING.NA_S]
public var WeekDaysNamePicker = [
    WeekDay(dayId:0, name:" "),
    WeekDay(dayId:1, name:STRING.MONDAY_S),
    WeekDay(dayId:2, name:STRING.TUESDAY_S),
    WeekDay(dayId:3, name:STRING.WEDNESDAY_S),
    WeekDay(dayId:4, name:STRING.THURSDAY_S),
    WeekDay(dayId:5, name:STRING.FRIDAY_S)]
public var BlocColors = [UIColor.systemYellow, UIColor.systemRed,UIColor.systemBlue, UIColor.systemCyan,UIColor.systemPink,UIColor.systemPurple,UIColor.systemOrange, UIColor.systemGreen,UIColor.systemBlue,UIColor.systemCyan]


public func addCourse(name:String, local:String, color:UIColor, start:String, end:String, selectedDay:Int) -> Bool
{
    let nbBloc = getBlocId(end: end) - getBlocId(start: start)
    if(name == "")
    {
        editorErrorMessage = STRING.E_NAME_S
        return true
    }
    else if(selectedDay == 0 )
    {
        editorErrorMessage = STRING.E_DAY_S
        return true
    }
    else if(start == STRING.NA_S)
    {
        editorErrorMessage = STRING.E_START_H_S
        return true
    }
    else if(end == STRING.NA_S)
    {
        editorErrorMessage = STRING.E_END_H_S
        return true
    }
    KIARA.schedule[selectedDay][getBlocId(start: start)] = CourseBloc(start: start, end: end, name: name, local: local, color: color, nbBloc: nbBloc)
    if(nbBloc > 0)
    {
        for i in 1...nbBloc {
            KIARA.schedule[selectedDay][getBlocId(start: start)+i] = EmptyBloc(start: start, end: end, display: false)
        }
    }
    resetStartHours()
    resetEndHours()
    
    API.updateUserSchedule(userid: KIARA.user.string(forKey: "userId")!)
    
    return false
}

private func getBlocId(start:String) -> Int
{
    var i = 0
    for bloc in KIARA.schedule[0]
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
    for bloc in KIARA.schedule[0]
    {
        if(bloc.end == end)
        {
            return i
        }
        i+=1
    }
    return -1
}

extension UIColor {
    var name: String? {
        switch self {
        case UIColor.systemGray : return STRING.C_GRAY_S
        case UIColor.systemRed: return STRING.C_RED_S
        case UIColor.systemGreen: return STRING.C_GREEN_S
        case UIColor.systemBlue: return STRING.C_BLUE_S
        case UIColor.systemCyan: return STRING.C_CYAN_S
        case UIColor.systemYellow: return STRING.C_YELLOW_S
        case UIColor.systemOrange: return STRING.C_ORANGE_S
        case UIColor.systemPink: return STRING.C_PINK_S
        case UIColor.systemPurple: return STRING.C_PURPLE_S
        case UIColor.systemBrown: return STRING.C_BROWN_S
        default: return nil
        }
    }
}

public func SetStartHours(selectedDay:Int){
    resetStartHours()
    if(selectedDay == 0){ return }
    
    for bloc in KIARA.schedule[selectedDay]{
        if let emptyBloc = bloc as? EmptyBloc{
            if(emptyBloc.display){
                StartHours.append(emptyBloc.start)
            }
        }
    }
    
}

public func SetEndHours(selectedDay:Int, start:String){
    
    resetEndHours()
    if(selectedDay == 0){ return }
    
    for bloc in KIARA.schedule[selectedDay]{
        if let emptyBloc = bloc as? EmptyBloc{
            if(emptyBloc.display && validateEndHour(start: getBlocId(start: start), end: getBlocId(end: bloc.end), day: selectedDay)){
                EndHours.append(emptyBloc.end)
            }
        }
    }
}

public func validateEndHour(start:Int, end:Int, day:Int) ->Bool
{
    var i = 0
    var u = false
    for bloc in KIARA.schedule[day]
    {
        if(i==start)
        {
            u = true
        }
        if(u)
        {
            if(i==end)
            {
                return true
            }
            if let emptyBloc = bloc as? EmptyBloc
            {
                if(!emptyBloc.display)
                {
                    return false
                }
            }
            else
            {
                return false
            }
        }
        
        i+=1
    }
    return false
}

public func resetColor(){
    
}

public func resetStartHours(){
    StartHours.removeAll()
    StartHours.append("N/A")
}

public func resetEndHours(){
    EndHours.removeAll()
    EndHours.append("N/A")
}

