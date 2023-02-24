//
//  DeleteCourse.swift
//  Kiara
//
//  Created by Ludovic Fournier on 2023-02-14.
//

import Foundation

public var courseOfDayPicker = [Course(StartHour: "", name: STRING.NA_S)]

public func updateCourseOfDay(selectedDay:Int){
    courseOfDayPicker.removeAll()
    courseOfDayPicker = [Course(StartHour: "", name: STRING.NA_S)]
    for bloc in KIARA.schedule[selectedDay]{
        if let courseBloc = bloc as? CourseBloc{
            courseOfDayPicker.append(Course(StartHour: courseBloc.start, name: courseBloc.name))
        }
    }
    
}

public func deleteCourse(courseDay:Int, courseStartHour:String){
    var i = 0
    var u = false
    for bloc in KIARA.schedule[courseDay]{
        if(u){
            if let emptyBloc = bloc as? EmptyBloc
            {
                if(emptyBloc.display)
                {
                    API.updateUserSchedule(userid: KIARA.user.string(forKey: "userId")!)
                    return
                }
                emptyBloc.display = true
            }
            else
            {
                API.updateUserSchedule(userid: KIARA.user.string(forKey: "userId")!)
                return
            }
        }
        if(bloc.start == courseStartHour){
            KIARA.schedule[courseDay][i] = EmptyBloc(start: bloc.start, end: bloc.end, display: true)
            u = true
        }
        i+=1
    }
    API.updateUserSchedule(userid: KIARA.user.string(forKey: "userId")!)
}
