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
    
    
    @AppStorage("userId") var userId: String = ""
    @AppStorage("firstName") var firstName: String = ""
    @AppStorage("lastName") var lastName: String = ""
    
    var body: some View {

            VStack{
                Spacer()
                Text("Kiara").fontWeight(.bold).font(.system(size: 55))
                Spacer()
                
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
                            showSignInView = false
                            
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
                Spacer()
            }
            .background(LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .top, endPoint: .bottom))
        
        
    }
}

//struct SignIn_Previews: PreviewProvider {
//    static var previews: some View {
//        SignInView()
//    }
//}
