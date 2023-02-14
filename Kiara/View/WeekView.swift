//
//  WeekView.swift
//  Kiara
//
//  Created by Ludovic Fournier on 2023-02-11.
//

import SwiftUI

let textFontSize = CGFloat(12)
let blocHeight = CGFloat(20)
let blocWidth = CGFloat(20)
let dayTextFontSize = CGFloat(17)
let courseOpacity = 0.8

struct WeekView: View {
    @State var blocsMonday = weekCourseBlocs[1]
    @State var blocsTuesday = weekCourseBlocs[2]
    @State var blocsWednesday = weekCourseBlocs[3]
    @State var blocsThursday = weekCourseBlocs[4]
    @State var blocsFriday = weekCourseBlocs[5]
    @State var courseBlocHeight = CGFloat(0)
    
    var body: some View {
        
        NavigationStack {
            HStack{
                
                VStack{
                    GeometryReader { proxy in
                        Text("")
                            .font(.system(size: CGFloat(textFontSize)))
                            .fixedSize(horizontal: true, vertical: true)
                            .multilineTextAlignment(.center)
                            .frame(width: 33, height: blocHeight)
                            .frame(maxHeight: .infinity)
                            .background(GeometryReader { textViewProxy in
                                Color.clear
                                    .onAppear {
                                        courseBlocHeight = CGFloat(textViewProxy.size.height)
                                    }
                            })
                    }
                    ForEach(weekCourseBlocs[0]) { timeBloc in
                        Text(timeBloc.start + "\n" + timeBloc.end)
                            .font(.system(size: CGFloat(textFontSize)))
                            .fixedSize(horizontal: true, vertical: true)
                            .multilineTextAlignment(.center)
                            .frame(width: 33, height: blocHeight)
                            .frame(maxHeight: .infinity)
                            .background(RoundedRectangle(cornerRadius: 3, style: .continuous).fill(Color(uiColor: .label)).opacity(0))
                        
                    }
                }
                VStack{
                    DayBlocView(blocsMonday: $blocsMonday, courseBlocHeight: $courseBlocHeight)
                }
                VStack{
                    DayBlocView(blocsMonday: $blocsTuesday, courseBlocHeight: $courseBlocHeight)
                }
                VStack{
                    DayBlocView(blocsMonday: $blocsWednesday, courseBlocHeight: $courseBlocHeight)
                }
                VStack{
                    DayBlocView(blocsMonday: $blocsThursday, courseBlocHeight: $courseBlocHeight)
                }
                VStack{
                    DayBlocView(blocsMonday: $blocsFriday, courseBlocHeight: $courseBlocHeight)
                }
            }
            .padding()
            .onAppear(){
                blocsMonday = weekCourseBlocs[1]
                blocsTuesday = weekCourseBlocs[2]
                blocsWednesday = weekCourseBlocs[3]
                blocsThursday = weekCourseBlocs[4]
                blocsFriday = weekCourseBlocs[5]
            }
            .navigationTitle(STRING.WEEK_S)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: CourseEditorView()) {
                        HStack{
                            Image(systemName: "square.and.pencil")
                        }
                    }
                }
            }
        }
        
    }
}


struct WeekView_Previews: PreviewProvider {
    static var previews: some View {
        WeekView()
    }
}
