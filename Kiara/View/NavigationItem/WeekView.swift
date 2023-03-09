//
//  WeekView.swift
//  Kiara
//
//  Created by Ludovic Fournier on 2023-02-11.
//

import SwiftUI

struct WeekView: View {
    
    @State var blocs = KIARA.schedule
    @State var courseBlocHeight = CGFloat(0)
    
    @State var showCourseEditor = false
    
    var body: some View {
        
        NavigationStack {
            HStack{
                
                VStack{
                    GeometryReader { proxy in
                        Text("")
                            .font(.system(size: CGFloat(KIARA.textFontSize)))
                            .fixedSize(horizontal: true, vertical: true)
                            .multilineTextAlignment(.center)
                            .frame(height: KIARA.blocHeight)
                            .frame(maxHeight: .infinity)
                            .background(GeometryReader { textViewProxy in
                                Color.clear
                                    .onAppear {
                                        courseBlocHeight = CGFloat(textViewProxy.size.height)
                                        KIARA.courseBlocHeight = courseBlocHeight
                                    }
                            })
                    }
                    ForEach(blocs[0]) { timeBloc in
                        Text(timeBloc.start + "\n" + timeBloc.end)
                            .font(.system(size: CGFloat(KIARA.textFontSize)))
                            .fixedSize(horizontal: true, vertical: true)
                            .multilineTextAlignment(.center)
                            .frame(height: KIARA.blocHeight)
                            .frame(maxHeight: .infinity)
                            .background(RoundedRectangle(cornerRadius: 3, style: .continuous).fill(Color(uiColor: .label)).opacity(0))
                        
                    }
                }
                .frame(width:43)
                VStack{
                    DayItem(blocs: $blocs[1], courseBlocHeight: $courseBlocHeight,dayName: STRING.MON_S)
                }
                VStack{
                    DayItem(blocs: $blocs[2], courseBlocHeight: $courseBlocHeight, dayName: STRING.TUES_S)
                }
                VStack{
                    DayItem(blocs: $blocs[3], courseBlocHeight: $courseBlocHeight, dayName: STRING.WED_S)
                }
                VStack{
                    DayItem(blocs: $blocs[4], courseBlocHeight: $courseBlocHeight,dayName: STRING.THU_S)
                }
                VStack{
                    DayItem(blocs: $blocs[5], courseBlocHeight: $courseBlocHeight, dayName: STRING.FRI_S)
                }
            }
            .padding()
            .onAppear(){
                blocs = KIARA.schedule
            }
            .navigationTitle(STRING.WEEK_S)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button{
                        showCourseEditor = true
                    } label: {
                        Image(systemName: "square.and.pencil")
                    }
                    .sheet(isPresented: $showCourseEditor,content:  {
                        CourseEditorView().onDisappear(){
                            blocs = KIARA.schedule
                        }
                    })
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
