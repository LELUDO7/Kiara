//
//  DayBlocView.swift
//  Kiara
//
//  Created by Ludovic Fournier on 2023-02-14.
//

import SwiftUI

struct DayBlocView: View {
    @Binding var blocsMonday: [Bloc]
    @Binding var courseBlocHeight : CGFloat
    var body: some View {
        VStack{
            Text(STRING.MON_S)
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
                                courseBlocHeight*(CGFloat(courseBloc.nbBloc)+1)+(CGFloat(courseBloc.nbBloc)*8))
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
}

//struct DayBlocView_Previews: PreviewProvider {
//    static var previews: some View {
//        DayBlocView(blocsMonday: <#[Bloc]#>, courseBlocHeight: <#CGFloat#>)
//    }
//}
