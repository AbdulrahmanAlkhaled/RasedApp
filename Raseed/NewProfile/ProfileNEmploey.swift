//
//  ProfileNEmploey.swift
//  Raseed
//
//  Created by Sara on 19/06/1445 AH.
//

import SwiftUI

struct ProfileNEmploey: View {
    
        
            @State var showGreeting = true
            @Environment(\.dismiss) var dismiss
           @Binding var appUser: AppUser?
            @AppStorage("isDarkMode") private var isDarkMode = false
           
        var body: some View {
            VStack(spacing: 45)  {
                Text("Settings")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                ScrollView {
                    VStack(spacing: 5) {
                        Text ("General")
                            .bold()
                            .font(.title2)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                        
                        List {
                            HStack {
                                HStack{
                                    
                                    Text("Dark Mode")
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .font(.title3)
                                        .foregroundStyle(.color)
                                    
                                    Toggle(isOn: $isDarkMode, label: {
                                        
                                    })
                                    .tint(.col1)
                                }
                                
                                
                                // Toggle("Appearnce", isOn: $showGreeting)
                                // .toggleStyle(SwitchToggleStyle(tint: .green))
                                
                                // .font(.title3)
                            }
                            
                            HStack {
                                
                                
                                Text("Language")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .font(.title3)
                                    .foregroundStyle(.color)
                                
                                Text("English")
                                    .foregroundStyle(.gray)
                                Image(systemName: "chevron.forward")
                                    .foregroundStyle(.color)
                            }
                            
                            
                        }
                        .listStyle(PlainListStyle())
                        .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                        VStack(spacing: 5) {
                            Text ("Account")
                                .bold()
                                .font(.title2)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                            
                            List {
                                HStack {
                                    
                                    Text("Change password")
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .font(.title3)
                                        .foregroundStyle(.color)
                                    
                                    Image(systemName: "chevron.forward")
                                        .foregroundStyle(.color)
                                }
                                
                                HStack {
                                    Text("Delete account")
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .font(.title3)
                                        .foregroundStyle(.color)
                                    
                                    
                                    Image(systemName: "chevron.forward")
                                        .foregroundStyle(.color)
                                }
                                
                                
                                
                            }
                            .listStyle(PlainListStyle())
                            .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                            
                        }
                        VStack(spacing: 5) {
                            Text ("About App")
                                .bold()
                                .font(.title2)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                            
                            List {
                                
                                HStack {
                                    Text("FAQs")
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .font(.title3)
                                        .foregroundStyle(.color)
                                    
                                    Image(systemName: "chevron.forward")
                                        .foregroundStyle(.color)
                                }
                                HStack{
                                    Text("Terms of service")
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .font(.title3)
                                        .foregroundStyle(.color)
                                    
                                    Image(systemName: "chevron.forward")
                                        .foregroundStyle(.color)
                                }
                                
                                HStack {
                                    Text("Privacy policy & Analytics")
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .font(.title3)
                                        .foregroundStyle(.color)
                                    
                                    
                                    Image(systemName: "chevron.forward")
                                        .foregroundStyle(.color)
                                }
                                
                                
                                
                            }
                            .listStyle(PlainListStyle())
                            .frame(height: 140)
                            
                        }
                        Button {
                            Task {
                                do {
                                    try await  AuthManager.shared.signOut()
                                    self.appUser = nil
                                } catch {
                                    print("enable to sign out")
                                }
                            }
                            
                        } label: {
                            Text("Log out")
                                .foregroundStyle(.white)
                                .bold()
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 340)
                                    .foregroundStyle(Color.red)
                                            
                                )
                        }
                        .frame(height: 120)
                        
                        
                    }
                }
                
                
                
                
            }
            }
    }


#Preview {
    ProfileNEmploey(appUser: .constant(.init(uid: "1234", email: "Moha@example.com")))
}
