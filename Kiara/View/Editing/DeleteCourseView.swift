//
//  DeleteCourseView.swift
//  Kiara
//
//  Created by Ludovic Fournier on 2023-02-14.
//

import SwiftUI

struct DeleteCourseView: View {
    @State var weekBlocs = KIARA.schedule
    @State var selectedDay = WeekDaysNamePicker[0]
    
    @State var selectedCourse = courseOfDayPicker[0]
    @State var courseOfDay = courseOfDayPicker
    
    @State var userGet = false
    
    var body: some View {
        NavigationStack {
            if(userGet)
            {
                VStack{
                    Form{
                        Picker(STRING.DAY_PICKER_S, selection: $selectedDay) { // 3
                            ForEach(WeekDaysNamePicker, id: \.self) { day in // 4
                                Text(day.name) // 5
                            }
                        }
                        .onChange(of: selectedDay) { newValue in
                            updateCourseOfDay(selectedDay: selectedDay.dayId)
                            courseOfDay = courseOfDayPicker
                            selectedCourse = courseOfDayPicker[0]
                        }
                        Picker(STRING.COURSE_PICKER_S, selection: $selectedCourse) { // 3
                            ForEach(courseOfDay, id: \.self) { course in // 4
                                Text(course.name + " " + course.StartHour ) // 5
                            }
                        }
                        Button(STRING.DELETE_S) {
                            deleteCourse(courseDay: selectedDay.dayId, courseStartHour: selectedCourse.StartHour)
                            courseOfDay = courseOfDayPicker
                            selectedCourse = courseOfDayPicker[0]
                            selectedDay = WeekDaysNamePicker[0]
                        }
                        .foregroundColor(.red)
                        
                    }
                }
                .navigationTitle(STRING.DELETE_COURSE_S)
                .onDisappear(){
                    courseOfDay = courseOfDayPicker
                    selectedCourse = courseOfDayPicker[0]
                    selectedDay = WeekDaysNamePicker[0]
                }
                
            }
        }
        .task {
            API.getUser(userId: KIARA.getDataFromUser(userKey: KIARA.userKeys.userId), completion: { ok in
                userGet = ok
            })
        }
    }
}

struct DeleteCourseView_Previews: PreviewProvider {
    static var previews: some View {
        DeleteCourseView()
    }
}
