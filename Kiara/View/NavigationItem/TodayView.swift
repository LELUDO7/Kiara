//
//  DayView.swift
//  Kiara
//
//  Created by Ludovic Fournier on 2023-02-11.
//

import SwiftUI

struct TodayView: View {
    @State var blocs = weekCourseBlocs
    @State var courseBlocHeight = CGFloat(0)
    
    @State var showCourseEditor = false
    var body: some View {
        NavigationStack {
            HStack{
                VStack{
                    GeometryReader { proxy in
                        Text("")
                            .font(.system(size: CGFloat(textFontSize)))
                            .fixedSize(horizontal: true, vertical: true)
                            .multilineTextAlignment(.center)
                            .frame(maxHeight: .infinity)
                            .background(GeometryReader { textViewProxy in
                                Color.clear
                                    .onAppear {
                                        courseBlocHeight = CGFloat(textViewProxy.size.height)
                                    }
                            })
                    }
                    ForEach(blocs[0]) { timeBloc in
                        Text(timeBloc.start + "\n" + timeBloc.end)
                            .font(.system(size: CGFloat(textFontSize)))
                            .fixedSize(horizontal: true, vertical: true)
                            .multilineTextAlignment(.center)
                            .frame(maxHeight: .infinity)
                    }
                }
                .frame(maxWidth: 43)
                VStack{
                    DayItem(blocs: $blocs[getDayId()], courseBlocHeight: $courseBlocHeight, dayName: getDayName())
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
            .onAppear(){
                blocs = weekCourseBlocs
            }
            .navigationTitle(STRING.TODAY_S)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {

                    Button{
                        showCourseEditor = true
                    } label: {
                        Image(systemName: "square.and.pencil")
                    }
                    .sheet(isPresented: $showCourseEditor,content:  {
                        CourseEditorView().onDisappear(){
                                    blocs = weekCourseBlocs
                                }
                            })
                }
            }
        }
    }
}

struct DayView_Previews: PreviewProvider {
    static var previews: some View {
        TodayView()
    }
}
