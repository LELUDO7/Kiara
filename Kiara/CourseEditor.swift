//
//  CourseEditor.swift
//  Kiara
//
//  Created by Ludovic Fournier on 2023-02-11.
//

import Foundation
import SwiftUI

public var editorErrorMessage:String = ""

public func addCourse(name:String, local:String, color:UIColor, start:String, end:String, selectedDay:String) -> Bool
{
    if(name == "")
    {
        editorErrorMessage = "Enter a name"
        return true
    }
    else if(selectedDay == "Select a day" )
    {
        editorErrorMessage = selectedDay
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
    switch selectedDay{
    case "monday":
        getBlocId(end: end)
        coursesBlocsMonday[getBlocId(start: start)] = CourseBloc(start: start, end: end, name: name, local: local, color: color, nbBloc: 0)
    case "tuesday":
        coursesBlocsTuesday[getBlocId(start: start)] = CourseBloc(start: start, end: end, name: name, local: local, color: color, nbBloc: 0)
    case "wednesday":
        coursesBlocsWednesday[getBlocId(start: start)] = CourseBloc(start: start, end: end, name: name, local: local, color: color, nbBloc: 0)
    case"thursday":
        coursesBlocsThursday[getBlocId(start: start)] = CourseBloc(start: start, end: end, name: name, local: local, color: color, nbBloc: 0)
    case "friday":
        coursesBlocsFriday[getBlocId(start: start)] = CourseBloc(start: start, end: end, name: name, local: local, color: color, nbBloc: 0)
    default:
        print("no day selected")
        
    }
    return false
}

private func getBlocId(start:String) -> Int
{
    for bloc in timesBlocs
    {
        if(bloc.start == start)
        {
            return bloc.blocId
        }
    }
    return -1
}

private func getBlocId(end:String) -> Int
{
    for bloc in timesBlocs
    {
        if(bloc.end == end)
        {
            return bloc.blocId
        }
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

public enum WeekDaysNamePicker : String, CaseIterable {
    case SelectDay = "Select a day"
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
}
public var StartHours = ["Select course start hour"]
public var EndHours = ["Select course end hour"]


public func SetStartHours(selectedDay:String){
    print(selectedDay)
    switch selectedDay{
    case "monday":
        resetStartHours()
        for bloc in coursesBlocsMonday{
            if let emptyBloc = bloc as? EmptyBloc{
                if(emptyBloc.display){
                    StartHours.append(emptyBloc.start)
                }
            }
        }
    case "tuesday":
        resetStartHours()
        for bloc in coursesBlocsTuesday{
            if let emptyBloc = bloc as? EmptyBloc{
                if(emptyBloc.display){
                    StartHours.append(emptyBloc.start)
                }
            }
        }
    case "wednesday":
        resetStartHours()
        for bloc in coursesBlocsWednesday{
            if let emptyBloc = bloc as? EmptyBloc{
                if(emptyBloc.display){
                    StartHours.append(emptyBloc.start)
                }
            }
        }
    case"thursday":
        resetStartHours()
        for bloc in coursesBlocsThursday{
            if let emptyBloc = bloc as? EmptyBloc{
                if(emptyBloc.display){
                    StartHours.append(emptyBloc.start)
                }
            }
        }
    case "friday":
        resetStartHours()
        for bloc in coursesBlocsFriday{
            if let emptyBloc = bloc as? EmptyBloc{
                if(emptyBloc.display){
                    StartHours.append(emptyBloc.start)
                }
            }
        }
    default:
        resetStartHours()
        
    }
    
}

public func SetEndHours(selectedDay:String){
    print(selectedDay)
    switch selectedDay{
    case "monday":
        resetEndHours()
        for bloc in coursesBlocsMonday{
            if let emptyBloc = bloc as? EmptyBloc{
                if(emptyBloc.display){
                    EndHours.append(emptyBloc.end)
                }
            }
        }
    case "tuesday":
        resetEndHours()
        for bloc in coursesBlocsTuesday{
            if let emptyBloc = bloc as? EmptyBloc{
                if(emptyBloc.display){
                    EndHours.append(emptyBloc.end)
                }
            }
        }
    case "wednesday":
        resetEndHours()
        for bloc in coursesBlocsWednesday{
            if let emptyBloc = bloc as? EmptyBloc{
                if(emptyBloc.display){
                    EndHours.append(emptyBloc.end)
                }
            }
        }
    case"thursday":
        resetEndHours()
        for bloc in coursesBlocsThursday{
            if let emptyBloc = bloc as? EmptyBloc{
                if(emptyBloc.display){
                    EndHours.append(emptyBloc.end)
                }
            }
        }
    case "friday":
        resetEndHours()
        for bloc in coursesBlocsFriday{
            if let emptyBloc = bloc as? EmptyBloc{
                if(emptyBloc.display){
                    EndHours.append(emptyBloc.end)
                }
            }
        }
    default:
        resetEndHours()
        
    }
    
}

public func resetStartHours(){
    StartHours.removeAll()
    StartHours.append("Select course start hour")
}

public func resetEndHours(){
    EndHours.removeAll()
    EndHours.append("Select course end hour")
}

