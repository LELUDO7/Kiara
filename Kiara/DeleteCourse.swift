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
    for bloc in weekCourseBlocs[selectedDay]{
        if let courseBloc = bloc as? CourseBloc{
            courseOfDayPicker.append(Course(StartHour: courseBloc.start, name: courseBloc.name))
        }
    }
    
}

public func deleteCourse(courseDay:Int, courseStartHour:String){
    var i = 0
    var u = false
    for bloc in weekCourseBlocs[courseDay]{
        if(u){
            if let emptyBloc = bloc as? EmptyBloc
            {
                if(emptyBloc.display)
                {
                    return
                }
                emptyBloc.display = true
            }
            else
            {
                return
            }
        }
        if(bloc.start == courseStartHour){
            weekCourseBlocs[courseDay][i] = EmptyBloc(start: bloc.start, end: bloc.end, display: true)
            u = true
        }
        i+=1
    }
}
