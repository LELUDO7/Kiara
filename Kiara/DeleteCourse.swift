//
//  DeleteCourse.swift
//  Kiara
//
//  Created by Ludovic Fournier on 2023-02-14.
//

import Foundation

public var courseOfDayPicker = [Course(StartHour: "", name: STRING.NA_S)]

public func getCourseOfDay(selectedDay:Int){
    for bloc in weekCourseBlocs[selectedDay]{
        if let courseBloc = bloc as? CourseBloc{
            courseOfDayPicker.append(Course(StartHour: courseBloc.start, name: courseBloc.name))
        }
    }
    
}
