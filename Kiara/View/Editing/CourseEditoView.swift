//
//  CourseEditorView.swift
//  Kiara
//
//  Created by Ludovic Fournier on 2023-02-11.
//

import SwiftUI

struct CourseEditorView: View {
    @State var isErrorShowing = false
    @State var errorMessage = editorErrorMessage
    
    @State var name: String = ""
    @State var local: String = ""
    
    @State var selectedColors = BlocColors[0]
    @State var selectedDay = WeekDaysNamePicker[0]
    @State var selectedStartHour = StartHours[0]
    @State var selectedEndHour = EndHours[0]
    
    @State var startHoursPicker = StartHours
    @State var endHoursPicker = EndHours
    
    @State var userGet = false
    var body: some View {
        NavigationStack{
            if(userGet)
            {
                VStack{
                    Form{
                        TextField(STRING.NAME_S, text: $name).multilineTextAlignment(.center)
                        TextField(STRING.LOCAL_S, text: $local).multilineTextAlignment(.center)
                        
                        Picker(STRING.COLOR_PICKER_S, selection: $selectedColors) { // 3
                            ForEach(BlocColors, id: \.self) { color in // 4
                                Text(color.name?.capitalized ?? "") // 5
                            }
                        }
                        Picker(STRING.DAY_PICKER_S, selection: $selectedDay) {
                            ForEach(WeekDaysNamePicker, id: \.self) { day in // 4
                                Text(day.name) // 5
                            }
                        }
                        .onChange(of: selectedDay){ newValue in
                            SetStartHours(selectedDay: selectedDay.dayId)
                            startHoursPicker = StartHours
                        }
                        Picker(STRING.START_H_PICKER_S, selection: $selectedStartHour) { // 3
                            ForEach(startHoursPicker, id: \.self) { hour in // 4
                                Text(hour)
                                
                            }
                        }
                        .onChange(of: selectedStartHour){ newValue in
                            SetEndHours(selectedDay: selectedDay.dayId, start: selectedStartHour)
                            endHoursPicker = EndHours
                        }
                        Picker(STRING.END_H_PICKER_S, selection: $selectedEndHour) { // 3
                            ForEach(endHoursPicker, id: \.self) { hour in // 4
                                Text(hour) // 5
                            }
                        }
                        Button(STRING.ADD_S) {
                            isErrorShowing = addCourse(name:name, local:local,color: selectedColors, start: selectedStartHour, end: selectedEndHour, selectedDay:selectedDay.dayId)
                            if(!isErrorShowing)
                            {
                                selectedDay = WeekDaysNamePicker[0]
                                selectedColors = BlocColors[0]
                                selectedStartHour = StartHours[0]
                                selectedEndHour = EndHours[0]
                                name = ""
                                local = ""
                            }
                        }
                        
                    }
                    
                }
                .alert(isPresented: $isErrorShowing) {
                    Alert(
                        title: Text(STRING.ERROR_S),
                        message: Text(editorErrorMessage),
                        dismissButton: .default(Text("OK"))
                    )
                }
                .onDisappear(){
                    resetStartHours()
                }
                .navigationTitle(STRING.ADD_COURSE_S)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: DeleteCourseView()) {
                            Text(STRING.DELETE_COURSE_S)
                                .frame(maxWidth: .infinity)
                        }
                    }
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


struct CourseEditorView_Previews: PreviewProvider {
    static var previews: some View {
        CourseEditorView()
    }
}
