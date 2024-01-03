//
//  ProfileEmployee.swift
//  Raseed
//
//  Created by ABDULRAHMAN AL-KHALED on 25/12/2023.
//

import SwiftUI

struct ProfileEmployee: View {
    @Binding var appUser: AppUser?
        @AppStorage("isDarkMode") private var isDarkMode = false
    var body: some View {
        NavigationStack{
            VStack{
                
                VStack{
                    Text("Profile")
                        .font(.title2).bold()
                    
                    Image(systemName: "person")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30)
                        .padding(25)
                        .background(.col1)
                        .clipShape(Circle())
                        .shadow(color: .gray.opacity(0.5),radius: 10)
                    VStack{
                        Text("Hello, ")
                        Text("Email@Example.com")
                            .tint(.gray)
                    }
                    VStack{
                        
                        Text ("System settings")
                            .bold()
                            .font(.title2)
                            .padding(.horizontal)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        List {
                            NavigationLink {
                                EditProfileView()
                            } label: {
                                
                                Text("Edit profile")
                            }
                            
                            
                            HStack{
                                Text("Dark Mode")
                                
                                Toggle(isOn: $isDarkMode, label: {
                                    
                                })
                                .tint(.myprimary)
                            }
                            
                            
                            
                            
                            NavigationLink {
                                HelpAndSupportView()
                            } label: {
                                Text("Help center")
                                
                            }
                        }.frame(height: 200)
                            .listStyle(PlainListStyle())
                        
                    }.foregroundColor(.black)
                        .padding(.vertical)
                    
                    
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
                            .frame(width: 360)
                            .foregroundStyle(Color.red)
                                    
                        )
                }
                .frame(height: 120)
                Spacer()
            }
        }
    }
}

#Preview {
    ProfileEmployee(appUser: .constant(.init(uid: "1234", email: "Moha@example.com")))
}
