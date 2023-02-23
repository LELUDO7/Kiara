//
//  SignIn.swift
//  Kiara
//
//  Created by Ludovic Fournier on 2023-02-20.
//
import AuthenticationServices
import SwiftUI

struct SignInView: View {
    @Environment(\.colorScheme) var colorScheme
    @Binding var showSignInView : Bool
    @State var APIOK = false
    
    @AppStorage("userId") var userId: String = ""
    @AppStorage("firstName") var firstName: String = ""
    @AppStorage("lastName") var lastName: String = ""
    
    var body: some View {

            ZStack{
                LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .topLeading, endPoint: .bottomTrailing).frame(maxWidth: .infinity)
                VStack{
                    Spacer()
                    Text("Kiara").fontWeight(.bold).font(.system(size: 55))
                    Spacer()
                    if(APIOK)
                    {
                        SignInWithAppleButton(.signIn){ request in
                            request.requestedScopes = [.fullName]
                        } onCompletion: { result in
                            
                            switch result{
                            case .success(let auth):
                                
                                switch auth.credential {
                                case let credantial as ASAuthorizationAppleIDCredential:
                                    
                                    let userId = credantial.user
                                    let firstName = credantial.fullName?.givenName
                                    let lastName = credantial.fullName?.familyName
                                    
                                    self.firstName = firstName ?? ""
                                    self.lastName = lastName ?? ""
                                    self.userId = userId
                                    API.checkIfUserExist(userid: userId, completion: { exist in
                                        
                                        if exist{
                                            API.getUser(userId: self.userId, completion: {_ in
                                                showSignInView = false
                                            })
                                        }
                                        else
                                        {
                                            API.creatUser()
                                            showSignInView = false
                                        }
                                        
                                    })
                                    
                                default:
                                    break
                                }
                            case .failure(let error):
                                print(error)
                            }
                        }
                        .signInWithAppleButtonStyle(
                            colorScheme == .dark ? .white : .black
                        )
                        .frame(height: 50)
                        .padding()
                        .cornerRadius(8)
                    }
                    else
                    {
                        Rectangle()
                            .frame(height:50)
                            .frame(width: .infinity)
                            .cornerRadius(8)
                            .padding()
                            .overlay( Label("Check your internet connection", systemImage: "icloud.slash.fill")
                                .foregroundColor(colorScheme != .dark ? .white : .black))
                       
                        
                    }
                    
                    
                    Spacer()
                }
                
            }
            .edgesIgnoringSafeArea(.all)
            .task {
                API.checkAPI{ success in
                    if success{
                        APIOK = true
                    }
                }
            }
            
        
        
    }
}



//struct SignIn_Previews: PreviewProvider {
//    static var previews: some View {
//        SignInView()
//    }
//}
