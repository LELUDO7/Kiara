//
//  DeleteCourseView.swift
//  Kiara
//
//  Created by Ludovic Fournier on 2023-02-14.
//

import SwiftUI

struct DeleteCourseView: View {
    @State var weekBlocs = weekCourseBlocs
    @State var selectedDay = WeekDaysNamePicker[0]
    
    @State var selectedCourse = courseOfDayPicker[0]
    @State var courseOfDay = courseOfDayPicker
    
    var body: some View {
        NavigationStack {
            VStack{
                Form{
                    Picker(STRING.DAY_PICKER_S, selection: $selectedDay) { // 3
                        ForEach(WeekDaysNamePicker, id: \.self) { day in // 4
                            Text(day.name) // 5
                        }
                    }
                    Picker(STRING.COURSE_PICKER_S, selection: $selectedCourse) { // 3
                        ForEach(courseOfDay, id: \.self) { course in // 4
                            Text(course.name + " " + course.StartHour ) // 5
                        }
                    }
                }
            }
            .navigationTitle(STRING.DELETE_COURSE_S)
        }
    }
}

struct DeleteCourseView_Previews: PreviewProvider {
    static var previews: some View {
        DeleteCourseView()
    }
}
