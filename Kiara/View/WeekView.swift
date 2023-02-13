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
    
    var body: some View {
        
        NavigationStack {
            HStack{
                
                
                VStack{
                    Text("")
                        .font(.system(size: CGFloat(textFontSize)))
                        .fixedSize(horizontal: true, vertical: true)
                        .multilineTextAlignment(.center)
                        .frame(width: 33, height: blocHeight)
                        .frame(maxHeight: .infinity)
                        .background(RoundedRectangle(cornerRadius: 3, style: .continuous).fill(Color(uiColor: .label)).opacity(0))
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
                    Text("Mon")
                        .font(.system(size: dayTextFontSize))
                        .fixedSize(horizontal: true, vertical: true)
                        .multilineTextAlignment(.center)
                        .frame(width: blocWidth, height: blocHeight)
                        .frame(maxWidth:.infinity)
                        .frame(maxHeight: .infinity)
                        .background(RoundedRectangle(cornerRadius: 3, style: .continuous).fill(Color.white).opacity(0))
                    ForEach(blocsMonday){bloc in
                        
                        if let courseBloc = bloc as? CourseBloc{
                            Text(courseBloc.name + "\n" + courseBloc.local)
                                .font(.system(size: textFontSize))
                                .fixedSize(horizontal: true, vertical: true)
                                .multilineTextAlignment(.center)
                                .frame(width: blocWidth, height:
                                        blocHeight*(CGFloat(courseBloc.nbBloc)+1)+(CGFloat(courseBloc.nbBloc)*8))
                                .frame(maxWidth:.infinity)
                                .frame(maxHeight: .infinity)
                                .background(RoundedRectangle(cornerRadius: 3, style: .continuous).fill(Color(uiColor: courseBloc.color)).opacity(courseOpacity))
                        }else if let emptyBloc = bloc as? EmptyBloc{
                            if(emptyBloc.display)
                            {
                                Text("")
                                    .fixedSize(horizontal: true, vertical: true)
                                    .multilineTextAlignment(.center)
                                    .frame(width: blocWidth, height: blocHeight)
                                    .frame(maxWidth:.infinity)
                                    .frame(maxHeight: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 3, style: .continuous).fill(Color(uiColor: .label)).opacity(0.4))
                            }
                        }
                        
                        
                    }
                    
                    
                }
                VStack{
                    Text("Tues")
                        .font(.system(size: dayTextFontSize))
                        .fixedSize(horizontal: true, vertical: true)
                        .multilineTextAlignment(.center)
                        .frame(width: blocWidth, height: blocHeight)
                        .frame(maxWidth:.infinity)
                        .frame(maxHeight: .infinity)
                        .background(RoundedRectangle(cornerRadius: 3, style: .continuous).fill(.white).opacity(0))
                    ForEach(blocsTuesday){bloc in
                        
                        if let courseBloc = bloc as? CourseBloc{
                            Text(courseBloc.name + "\n" + courseBloc.local)
                                .font(.system(size: textFontSize))
                                .fixedSize(horizontal: true, vertical: true)
                                .multilineTextAlignment(.center)
                                .frame(width: blocWidth, height: blocHeight*(CGFloat(courseBloc.nbBloc)+1)+(CGFloat(courseBloc.nbBloc)*8))
                                .frame(maxWidth:.infinity)
                                .frame(maxHeight: .infinity)
                                .background(RoundedRectangle(cornerRadius: 3, style: .continuous).fill(Color(uiColor: courseBloc.color)).opacity(courseOpacity))
                        }else if let emptyBloc = bloc as? EmptyBloc{
                            if(emptyBloc.display)
                            {
                                Text("")
                                    .fixedSize(horizontal: true, vertical: true)
                                    .multilineTextAlignment(.center)
                                    .frame(width: blocWidth, height: blocHeight)
                                    .frame(maxWidth:.infinity)
                                    .frame(maxHeight: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 3, style: .continuous).fill(Color(uiColor: .label)).opacity(0.4))
                            }
                        }
                        
                        
                    }
                    
                    
                }
                VStack{
                    Text("Wed")
                        .font(.system(size: dayTextFontSize))
                        .fixedSize(horizontal: true, vertical: true)
                        .multilineTextAlignment(.center)
                        .frame(width: blocWidth, height: blocHeight)
                        .frame(maxWidth:.infinity)
                        .frame(maxHeight: .infinity)
                        .background(RoundedRectangle(cornerRadius: 3, style: .continuous).fill(Color.white).opacity(0))
                    ForEach(blocsWednesday){bloc in
                        
                        if let courseBloc = bloc as? CourseBloc{
                            Text(courseBloc.name + "\n" + courseBloc.local)
                                .font(.system(size: textFontSize))
                                .fixedSize(horizontal: true, vertical: true)
                                .multilineTextAlignment(.center)
                                .frame(width: blocWidth, height: blocHeight*(CGFloat(courseBloc.nbBloc)+1)+(CGFloat(courseBloc.nbBloc)*8))
                                .frame(maxWidth:.infinity)
                                .frame(maxHeight: .infinity)
                                .background(RoundedRectangle(cornerRadius: 3, style: .continuous).fill(Color(uiColor: courseBloc.color)).opacity(courseOpacity))
                        }else if let emptyBloc = bloc as? EmptyBloc{
                            if(emptyBloc.display)
                            {
                                Text("")
                                    .fixedSize(horizontal: true, vertical: true)
                                    .multilineTextAlignment(.center)
                                    .frame(width: blocWidth, height: blocHeight)
                                    .frame(maxWidth:.infinity)
                                    .frame(maxHeight: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 3, style: .continuous).fill(Color(uiColor: .label)).opacity(0.4))
                            }
                        }
                        
                        
                    }
                    
                    
                }
                VStack{
                    Text("Thu")
                        .font(.system(size: dayTextFontSize))
                        .fixedSize(horizontal: true, vertical: true)
                        .multilineTextAlignment(.center)
                        .frame(width: blocWidth, height: blocHeight)
                        .frame(maxWidth:.infinity)
                        .frame(maxHeight: .infinity)
                        .background(RoundedRectangle(cornerRadius: 3, style: .continuous).fill(Color.white).opacity(0))
                    ForEach(blocsThursday){bloc in
                        
                        if let courseBloc = bloc as? CourseBloc{
                            Text(courseBloc.name + "\n" + courseBloc.local)
                                .font(.system(size: textFontSize))
                                .fixedSize(horizontal: true, vertical: true)
                                .multilineTextAlignment(.center)
                                .frame(width: blocWidth, height: blocHeight*(CGFloat(courseBloc.nbBloc)+1)+(CGFloat(courseBloc.nbBloc)*8))
                                .frame(maxWidth:.infinity)
                                .frame(maxHeight: .infinity)
                                .background(RoundedRectangle(cornerRadius: 3, style: .continuous).fill(Color(uiColor: courseBloc.color)).opacity(courseOpacity))
                        }else if let emptyBloc = bloc as? EmptyBloc{
                            if(emptyBloc.display)
                            {
                                Text("")
                                    .fixedSize(horizontal: true, vertical: true)
                                    .multilineTextAlignment(.center)
                                    .frame(width: blocWidth, height: blocHeight)
                                    .frame(maxWidth:.infinity)
                                    .frame(maxHeight: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 3, style: .continuous).fill(Color(uiColor: .label)).opacity(0.4))
                            }
                        }
                        
                        
                    }
                    
                    
                }
                VStack{
                    Text("Fri")
                        .font(.system(size: dayTextFontSize))
                        .fixedSize(horizontal: true, vertical: true)
                        .multilineTextAlignment(.center)
                        .frame(width: blocWidth, height: blocHeight)
                        .frame(maxWidth:.infinity)
                        .frame(maxHeight: .infinity)
                        .background(RoundedRectangle(cornerRadius: 3, style: .continuous).fill(Color.white).opacity(0))
                    ForEach(blocsFriday){bloc in
                        
                        if let courseBloc = bloc as? CourseBloc{
                            Text(courseBloc.name + "\n" + courseBloc.local)
                                .font(.system(size: textFontSize))
                                .fixedSize(horizontal: true, vertical: true)
                                .multilineTextAlignment(.center)
                                .frame(width: blocWidth, height: blocHeight*(CGFloat(courseBloc.nbBloc)+1)+(CGFloat(courseBloc.nbBloc)*8))
                                .frame(maxWidth:.infinity)
                                .frame(maxHeight: .infinity)
                                .background(RoundedRectangle(cornerRadius: 3, style: .continuous).fill(Color(uiColor: courseBloc.color)).opacity(courseOpacity))
                        }else if let emptyBloc = bloc as? EmptyBloc{
                            if(emptyBloc.display)
                            {
                                Text("")
                                    .fixedSize(horizontal: true, vertical: true)
                                    .multilineTextAlignment(.center)
                                    .frame(width: blocWidth, height: blocHeight)
                                    .frame(maxWidth:.infinity)
                                    .frame(maxHeight: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 3, style: .continuous).fill(Color(uiColor: .label)).opacity(0.4))
                            }
                        }
                        
                        
                    }
                    
                    
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
            .navigationTitle("Week")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink("Add course") {
                        CourseEditorView()
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
