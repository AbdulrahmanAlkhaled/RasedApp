//
//  SignIn3View.swift
//  Raseed
//
//  Created by ABDULRAHMAN AL-KHALED on 04/01/2024.
//

import SwiftUI

struct SignIn3View: View {
        @StateObject var vm = SignInViewModel()
        @Environment(\.dismiss) var dismiss
        @State private var isLoggedIn = false
        
        @State var email = ""
        @State var password = ""
        @State var isRegistrationPresented = false
        @State var isSignUp: Bool = false
        @Binding var appUser: AppUser?
        
        var body: some View {
                VStack(spacing: 100) {
                    Text("Sign in")
                        .font(.largeTitle)
                        .bold()
                    VStack(spacing: 8*7){
                        EmailFieldView(text: $email)
                        PasswordFieldView(text: $password)
                        
                        
                        Button {
                            Task{
                                do {
                                    let appUser  = try await  vm.signInWithEmail(email: email, password: password)
                                    self.appUser = appUser
                                    
                                    
                                } catch {
                                    print("some issues")
                                }
                            }
                        } label: {
                            Text("Sign in")
                                .foregroundStyle(.white)
                                .bold()
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 360)
                                    .foregroundStyle(Color.myprimary))
                                            
                        }
                    }
                }
            
                .padding()
            Spacer()
        }
    }

#Preview {
    SignIn3View(appUser: .constant(.init(uid: "1234", email: nil)))
        .environmentObject(SignInViewModel())
}
