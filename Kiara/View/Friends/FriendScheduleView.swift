//
//  FriendScheduleView.swift
//  Kiara
//
//  Created by Ludovic Fournier on 2023-03-09.
//

import SwiftUI

struct FriendScheduleView: View {
    
    @State var friend : Friend
    @State var schedule : [[Bloc]]
    @State var courseBlocHeight = KIARA.courseBlocHeight
    
    @State var show = false
    
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
                                        //courseBlocHeight = textViewProxy.size.height
                                    }
                            })
                    }
                    ForEach(KIARA.schedule[0]) { timeBloc in
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
                        DayItem(blocs: $schedule[1], courseBlocHeight: $courseBlocHeight, dayName: STRING.MON_S)
                    }
                    VStack{
                        DayItem(blocs: $schedule[2], courseBlocHeight: $courseBlocHeight, dayName: STRING.TUES_S)
                    }
                    VStack{
                        DayItem(blocs: $schedule[3], courseBlocHeight: $courseBlocHeight, dayName: STRING.WED_S)
                    }
                    VStack{
                        DayItem(blocs: $schedule[4], courseBlocHeight: $courseBlocHeight,dayName: STRING.THU_S)
                    }
                    VStack{
                        DayItem(blocs: $schedule[5], courseBlocHeight: $courseBlocHeight, dayName: STRING.FRI_S)
                    }

                
                
            }
            .padding()
            .onAppear(){
                schedule = friend.schedule
            }
            .navigationTitle(friend.firstName + " " + friend.lastName)
            
        }
        
    }
}



