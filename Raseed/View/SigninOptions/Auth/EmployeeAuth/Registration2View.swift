//
//  Signup2View.swift
//  Raseed
//
//  Created by ABDULRAHMAN AL-KHALED on 24/12/2023.
//

import SwiftUI
import Supabase

struct Registration2View: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var vm: SignInViewModel
    @State var email = ""
    @State var password = ""
    @State var isActive = false
    
    @Binding var appUser: AppUser?
    var body: some View {
        
        if isActive {
        }else{
            VStack(spacing: 140) {
                Text("Sign up")
                    .font(.largeTitle)
                    .bold()
                VStack(spacing: 15){
                    EmailFieldView(text: $email)
                    PasswordFieldView(text: $password)
                    
                    
                    Button {
                        Task{
                            do {
                                let appUser  =  try await vm.registerNewUserWithEmail(email: email, password: password)
                                self.appUser = appUser
                                dismiss.callAsFunction()
                            }catch {
                                print("issue with signup")
                            }
                        }
                    } label: {
                        Text("Sign up")
                            .foregroundStyle(Color(uiColor: .systemBackground))
                            .bold()
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 20)
                                .frame(width: 360)
                                .foregroundStyle(Color.myprimary)
                                        
                            )
                            .padding()
                    }
                }
            }
            
            .padding()
            Spacer()
        }
    }
}
#Preview {
    Registration2View(appUser: .constant(.init(uid: "", email: nil)))
        .environmentObject(SignInViewModel())
}
