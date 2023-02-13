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
    @State var selectedDay = WeekDaysNamePicker.SelectDay
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
            Picker("Pick a day", selection: $selectedDay) { // 3
                ForEach(WeekDaysNamePicker.allCases, id: \.self) { day in // 4
                    Text(day.rawValue.capitalized) // 5
                }
            }
            .onChange(of: selectedDay){ newValue in
                SetStartHours(selectedDay: selectedDay.rawValue)
                startHoursPicker = StartHours
                SetEndHours(selectedDay: selectedDay.rawValue)
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
                isErrorShowing = addCourse(name:name, local:local,color: selectedColors, start: selectedStartHour, end: selectedEndHour, selectedDay:selectedDay.rawValue)

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
