//
//  Signin2View.swift
//  Raseed
//
//  Created by ABDULRAHMAN AL-KHALED on 24/12/2023.
//

import SwiftUI

struct SignIn2View: View {
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
                VStack(spacing: 30){
                    VStack(spacing: 8*6){
                        EmailFieldView(text: $email)
                        PasswordFieldView(text: $password)
                    }
                    VStack(spacing: 8*2) {
                        Button("New User? Register here") {
                            isRegistrationPresented.toggle()
                            
                        }
                        .sheet(isPresented: $isRegistrationPresented) {
                            RegistrationView( appUser: $appUser)
                                .environmentObject(vm)
                        }
                        .padding()
                        .foregroundStyle(Color.color1)
                        
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

            }
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                        Button(action: {
                            dismiss()
                        }, label: {
                            Image(systemName: "chevron.backward")
                                .foregroundStyle(.gray)
                        }
                               
                        )
                    }
                
               
            }
            .padding()
        Spacer()
    }
}

#Preview {
    SignIn2View(appUser: .constant(.init(uid: "1234", email: nil)))
        .environmentObject(SignInViewModel())

}
