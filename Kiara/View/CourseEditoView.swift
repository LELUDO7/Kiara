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
    var body: some View {
        VStack{
            TextField("Name", text: $name).multilineTextAlignment(.center)
            TextField("Local", text: $local).multilineTextAlignment(.center)
            
            Picker("Pick a color", selection: $selectedColors) { // 3
                ForEach(BlocColors, id: \.self) { color in // 4
                    Text(color.name?.capitalized ?? "") // 5
                }
            }
            Picker("Pick a day", selection: $selectedDay) {
                ForEach(WeekDaysNamePicker, id: \.self) { day in // 4
                    Text(day.name) // 5
                }
            }
            .onChange(of: selectedDay){ newValue in
                SetStartHours(selectedDay: selectedDay.dayId)
                startHoursPicker = StartHours
                SetEndHours(selectedDay: selectedDay.dayId)
                endHoursPicker = EndHours
            }
            Picker("Pick a Start Hour", selection: $selectedStartHour) { // 3
                ForEach(startHoursPicker, id: \.self) { hour in // 4
                    Text(hour) // 5
                }
            }
            Picker("Pick a end Hour", selection: $selectedEndHour) { // 3
                ForEach(endHoursPicker, id: \.self) { hour in // 4
                    Text(hour) // 5
                }
            }
            Button("Add course") {
                isErrorShowing = addCourse(name:name, local:local,color: selectedColors, start: selectedStartHour, end: selectedEndHour, selectedDay:selectedDay.dayId)
                if(!isErrorShowing)
                {
                    selectedDay = WeekDaysNamePicker[0]
                    selectedColors = BlocColors[0]
                    selectedStartHour = StartHours[0]
                    selectedEndHour = EndHours[0]
                }
            }
        }
        .alert(isPresented: $isErrorShowing) {
                    Alert(
                        title: Text("Error"),
                        message: Text(editorErrorMessage),
                        dismissButton: .default(Text("OK"))
                    )
                }
        .onDisappear(){
            resetStartHours()
        }
        .navigationTitle("Add course")
    }
    
}


struct CourseEditorView_Previews: PreviewProvider {
    static var previews: some View {
        CourseEditorView()
    }
}
