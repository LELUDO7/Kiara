//
//  WeekView.swift
//  Kiara
//
//  Created by Ludovic Fournier on 2023-02-11.
//

import SwiftUI

let textFontSize = CGFloat(12)
let blocHeight = CGFloat(40)
let blocWidth = CGFloat(55)
let dayTextFontSize = CGFloat(17)
let courseOpacity = 0.8

struct WeekView: View {
    @State var blocsMonday = coursesBlocsMonday
    @State var blocsTuesday = coursesBlocsTuesday
    @State var blocsWednesday = coursesBlocsWednesday
    @State var blocsThursday = coursesBlocsThursday
    @State var blocsFriday = coursesBlocsFriday
    
    var body: some View {
        
        NavigationStack {
            HStack{
                
                
                VStack{
                    Text("")
                        .font(.system(size: CGFloat(textFontSize)))
                        .fixedSize(horizontal: true, vertical: true)
                        .multilineTextAlignment(.center)
                        .frame(width: blocWidth, height: blocHeight)
                        .background(RoundedRectangle(cornerRadius: 3, style: .continuous).fill(Color(uiColor: .label)).opacity(0))
                    ForEach(timesBlocs) { timeBloc in
                        Text(timeBloc.start + "\n" + timeBloc.end)
                            .font(.system(size: CGFloat(textFontSize)))
                            .fixedSize(horizontal: true, vertical: true)
                            .multilineTextAlignment(.center)
                            .frame(width: blocWidth, height: blocHeight)
                            .background(RoundedRectangle(cornerRadius: 3, style: .continuous).fill(Color(uiColor: .label)).opacity(0))
                        
                    }
                }
                VStack{
                    Text("Mon")
                        .font(.system(size: dayTextFontSize))
                        .fixedSize(horizontal: true, vertical: true)
                        .multilineTextAlignment(.center)
                        .frame(width: blocWidth, height: blocHeight)
                        .background(RoundedRectangle(cornerRadius: 3, style: .continuous).fill(Color.white).opacity(0))
                    ForEach(blocsMonday){bloc in
                        
                        if let courseBloc = bloc as? CourseBloc{
                            Text(courseBloc.name + "\n" + courseBloc.local)
                                .font(.system(size: textFontSize))
                                .fixedSize(horizontal: true, vertical: true)
                                .multilineTextAlignment(.center)
                                .frame(width: blocWidth, height:
                                        blocHeight*(CGFloat(courseBloc.nbBloc)+1)+(CGFloat(courseBloc.nbBloc)*8))
                                .background(RoundedRectangle(cornerRadius: 3, style: .continuous).fill(Color(uiColor: courseBloc.color)).opacity(courseOpacity))
                        }else if let emptyBloc = bloc as? EmptyBloc{
                            if(emptyBloc.display)
                            {
                                Text("")
                                    .fixedSize(horizontal: true, vertical: true)
                                    .multilineTextAlignment(.center)
                                    .frame(width: blocWidth, height: blocHeight)
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
                        .background(RoundedRectangle(cornerRadius: 3, style: .continuous).fill(.white).opacity(0))
                    ForEach(blocsTuesday){bloc in
                        
                        if let courseBloc = bloc as? CourseBloc{
                            Text(courseBloc.name + "\n" + courseBloc.local)
                                .font(.system(size: textFontSize))
                                .fixedSize(horizontal: true, vertical: true)
                                .multilineTextAlignment(.center)
                                .frame(width: blocWidth, height: blocHeight*(CGFloat(courseBloc.nbBloc)+1)+(CGFloat(courseBloc.nbBloc)*8))
                                .background(RoundedRectangle(cornerRadius: 3, style: .continuous).fill(Color(uiColor: courseBloc.color)).opacity(courseOpacity))
                        }else if let emptyBloc = bloc as? EmptyBloc{
                            if(emptyBloc.display)
                            {
                                Text("")
                                    .fixedSize(horizontal: true, vertical: true)
                                    .multilineTextAlignment(.center)
                                    .frame(width: blocWidth, height: blocHeight)
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
                        .background(RoundedRectangle(cornerRadius: 3, style: .continuous).fill(Color.white).opacity(0))
                    ForEach(blocsWednesday){bloc in
                        
                        if let courseBloc = bloc as? CourseBloc{
                            Text(courseBloc.name + "\n" + courseBloc.local)
                                .font(.system(size: textFontSize))
                                .fixedSize(horizontal: true, vertical: true)
                                .multilineTextAlignment(.center)
                                .frame(width: blocWidth, height: blocHeight*(CGFloat(courseBloc.nbBloc)+1)+(CGFloat(courseBloc.nbBloc)*8))
                                .background(RoundedRectangle(cornerRadius: 3, style: .continuous).fill(Color(uiColor: courseBloc.color)).opacity(courseOpacity))
                        }else if let emptyBloc = bloc as? EmptyBloc{
                            if(emptyBloc.display)
                            {
                                Text("")
                                    .fixedSize(horizontal: true, vertical: true)
                                    .multilineTextAlignment(.center)
                                    .frame(width: blocWidth, height: blocHeight)
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
                        .background(RoundedRectangle(cornerRadius: 3, style: .continuous).fill(Color.white).opacity(0))
                    ForEach(blocsThursday){bloc in
                        
                        if let courseBloc = bloc as? CourseBloc{
                            Text(courseBloc.name + "\n" + courseBloc.local)
                                .font(.system(size: textFontSize))
                                .fixedSize(horizontal: true, vertical: true)
                                .multilineTextAlignment(.center)
                                .frame(width: blocWidth, height: blocHeight*(CGFloat(courseBloc.nbBloc)+1)+(CGFloat(courseBloc.nbBloc)*8))
                                .background(RoundedRectangle(cornerRadius: 3, style: .continuous).fill(Color(uiColor: courseBloc.color)).opacity(courseOpacity))
                        }else if let emptyBloc = bloc as? EmptyBloc{
                            if(emptyBloc.display)
                            {
                                Text("")
                                    .fixedSize(horizontal: true, vertical: true)
                                    .multilineTextAlignment(.center)
                                    .frame(width: blocWidth, height: blocHeight)
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
                        .background(RoundedRectangle(cornerRadius: 3, style: .continuous).fill(Color.white).opacity(0))
                    ForEach(blocsFriday){bloc in
                        
                        if let courseBloc = bloc as? CourseBloc{
                            Text(courseBloc.name + "\n" + courseBloc.local)
                                .font(.system(size: textFontSize))
                                .fixedSize(horizontal: true, vertical: true)
                                .multilineTextAlignment(.center)
                                .frame(width: blocWidth, height: blocHeight*(CGFloat(courseBloc.nbBloc)+1)+(CGFloat(courseBloc.nbBloc)*8))
                                .background(RoundedRectangle(cornerRadius: 3, style: .continuous).fill(Color(uiColor: courseBloc.color)).opacity(courseOpacity))
                        }else if let emptyBloc = bloc as? EmptyBloc{
                            if(emptyBloc.display)
                            {
                                Text("")
                                    .fixedSize(horizontal: true, vertical: true)
                                    .multilineTextAlignment(.center)
                                    .frame(width: blocWidth, height: blocHeight)
                                    .background(RoundedRectangle(cornerRadius: 3, style: .continuous).fill(Color(uiColor: .label)).opacity(0.4))
                            }
                        }
                        
                        
                    }
                    
                    
                }
            }
            .onAppear(){
                blocsMonday = coursesBlocsMonday
                blocsTuesday = coursesBlocsTuesday
                blocsWednesday = coursesBlocsWednesday
                blocsThursday = coursesBlocsThursday
                blocsFriday = coursesBlocsFriday
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
