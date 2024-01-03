//
//  ProfileParents.swift
//  Raseed
//
//  Created by ABDULRAHMAN AL-KHALED on 25/12/2023.
//

import SwiftUI

struct ProfileParents: View {
    @Binding var appUser: AppUser?

        @AppStorage("isDarkMode") private var isDarkMode = false
        var body: some View {
            NavigationStack{
                
                VStack(spacing: 40){
                    
                    
                    // NavigationLink {
                    //  Text("")
                    // } label: {
                    // BackButton()
                    //  }.foregroundColor(.gray)
                    
                  //  HStack{
                    //    Image(systemName:"bell")
                     //   Spacer()
                    //    Image("loc")
                        
                 //   }
                    
                    VStack{
                        Text("").navigationTitle("Profile")
                           // .font(.title2).bold().frame(maxWidth:.infinity,alignment: .leading)
                        
                        
                        
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
                        VStack(spacing:20){
                            
                            NavigationLink {
                                EditProfileView()
                            } label: {
                                ProfileList(img: "person.circle", title: "Edit Profile")
                                
                            }
                            NavigationLink {
                                Text("")
                            } label: {
                                ProfileList(img: "gearshape", title: "Terms of service").foregroundColor(.black)
                                
                            }
                            
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.back).stroke(.col1)
                                .frame(width: 350,height: 55)
                                .overlay {
                                    HStack{
                                        Image(systemName: "circle")
                                        Text("Dark Mode")
                                        Spacer()
                                        
                                        Toggle(isOn: $isDarkMode, label: {
                                            
                                        })
                                        .tint(.col1)
                                    }.padding(.horizontal)
                                }
                            
                            
                            
                            NavigationLink {
                                HelpAndSupportView()
                            } label: {
                                ProfileList(img: "info.circle", title: "Help & Support")
                                
                            }
                            
                        }.foregroundColor(.black)
                        
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
                                .frame(width: 350)
                                .foregroundStyle(Color.red)
                                        
                            )
                    }
                        .frame(height: 120)
                           // Button {
                                
                           // } label: {
                             //   Text("Log Out")
                           // }.foregroundColor(.red)
                            
                        
                        Spacer()
                    }//.navigationTitle("Notifications")
                        .navigationBarItems(trailing: Button(action: {}) {
                            Image(systemName: "bell")
                                .padding(4)
                                .foregroundStyle(.black)
                                                    .background(RoundedRectangle(cornerRadius: 10)
                                                        .foregroundStyle(.gray.opacity(0.1))
                                                    )
                        }
                        )
                }.padding()
                    .navigationBarBackButtonHidden(true)
            }
                
            }
        }
  
#Preview {
    ProfileParents(appUser: .constant(.init(uid: "1234", email: "Moha@example.com")))
}

