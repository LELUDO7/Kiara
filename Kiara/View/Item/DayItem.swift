//
//  DayBlocView.swift
//  Kiara
//
//  Created by Ludovic Fournier on 2023-02-14.
//

import SwiftUI

struct DayItem: View {
    @Binding var blocs: [Bloc]
    @Binding var courseBlocHeight : CGFloat
    @State var dayName : String
    var body: some View {
        VStack{
            Text(dayName)
                .font(.system(size: KIARA.dayTextFontSize))
                .fixedSize(horizontal: true, vertical: true)
                .multilineTextAlignment(.center)
                .frame(width: KIARA.blocWidth, height: KIARA.blocHeight)
                .frame(maxWidth:.infinity)
                .frame(maxHeight: .infinity)
                .background(RoundedRectangle(cornerRadius: 3, style: .continuous).fill(Color.white).opacity(0))
            ForEach(blocs){bloc in
                
                if let courseBloc = bloc as? CourseBloc{
                    Text(courseBloc.name.prefix(8) + "\n" + courseBloc.local)
                        .font(.system(size: KIARA.textFontSize))
                        .fixedSize(horizontal: true, vertical: true)
                        .multilineTextAlignment(.center)
                        .frame(width: KIARA.blocWidth, height:
                                courseBlocHeight*(CGFloat(courseBloc.nbBloc)+1)+(CGFloat(courseBloc.nbBloc)*8))
                        .frame(maxWidth:.infinity)
                        .frame(maxHeight: .infinity)
                        .background(RoundedRectangle(cornerRadius: 3, style: .continuous).fill(Color(uiColor: courseBloc.color)).opacity(KIARA.courseOpacity))

                }else if let emptyBloc = bloc as? EmptyBloc{
                    if(emptyBloc.display)
                    {
                        Text("")
                            .fixedSize(horizontal: true, vertical: true)
                            .multilineTextAlignment(.center)
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
