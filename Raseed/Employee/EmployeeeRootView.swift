//
//  ContentViewEmployee.swift
//  Raseed
//
//  Created by ABDULRAHMAN AL-KHALED on 25/12/2023.
//

import SwiftUI

struct EmployeeeRootView: View {
    @Binding var appUser: AppUser?
        @State var selection: Int = 0
        @State var onboardingComplete: Bool = false
        var body: some View {
                TabView(selection: $selection) {
                    
                    HomeViewEmployee()
                        .tag(0)
                    
                    NotifcationEmpolyee()
                        .tag(1)
                    
                    FilteringChat2View()
                        .tag(2)
                    
                    ProfileNEmploey(appUser: $appUser)
                        .tag(3)
                    
                }
                //.navigationBarBackButtonHidden(true)

                .overlay( // Overlay the custom TabView component here
                    Color.clear
                        .cornerRadius(10)
                    // Base color for Tab Bar
                        .edgesIgnoringSafeArea(.vertical)
                        .frame(height: 50).opacity(0.8) // Match Height of native bar
                        .overlay(HStack {
                            Spacer()
                            
                            // First Tab Button
                            Button(action: {
                                self.selection = 0
                            }, label: {
                                Image(systemName: "house")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 40, height: 25, alignment: .center)
                                    .foregroundColor(selection == 0 ?  .white : .black.opacity(0.6))
                                    .padding(10)
                                    .background(selection == 0 ? .col1.opacity(0.7)  : .clear)
                                    .clipShape(Circle())
                                
                            })
                            Spacer()
                            
                            // Second Tab Button
                            Button(action: {
                                self.selection = 1
                            }, label: {
                                Image(systemName: "bell")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 40, height: 25, alignment: .center)
                                    .foregroundColor(selection == 1 ?  .white : .black.opacity(0.6))
                                    .padding(10)
                                    .background(selection == 1 ? .col1.opacity(0.7)  : .clear)
                                    .clipShape(Circle())
                                
                            })
                            
                            Spacer()
                            
                            // Third Tab Button
                            Button(action: {
                                self.selection = 2
                            }, label: {
                                Image(systemName: "text.bubble")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 40, height: 25, alignment: .center)
                                    .foregroundColor(selection == 2 ?  .white : .black.opacity(0.6))
                                    .padding(10)
                                    .background(selection == 2 ? .col1.opacity(0.7)  : .clear)
                                    .clipShape(Circle())
                                
                            })
                            Spacer()
                            Button(action: {
                                self.selection = 3
                            }, label: {
                                Image(systemName: "person")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 40, height: 25, alignment: .center)
                                    .foregroundColor(selection == 3 ?  .white : .black.opacity(0.6))
                                    .padding(10)
                                    .background(selection == 3 ? .col1.opacity(0.7)  : .clear)
                                    .clipShape(Circle())
                                
                            })
                            Spacer()
                            
                        })
                    ,alignment: .bottom)
            
    }
}

#Preview {
    EmployeeeRootView(appUser: .constant(.init(uid: "1234", email: "Moha@example.com")))
}
