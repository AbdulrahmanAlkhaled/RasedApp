//
//  ProfileView.swift
//  Raseed
//
//  Created by ABDULRAHMAN AL-KHALED on 04/01/2024.
//

import SwiftUI

struct ProfileView: View {
    @State private var showGreeting = true
    @Environment(\.dismiss) var dismiss
    @Binding var appUser: AppUser?
    @AppStorage("isDarkMode") private var isDarkMode = false

    var body: some View {
        VStack(spacing: 45)  {

            VStack(spacing: 15) {
                
                
                List {
                    HStack {
                        Text("Appearnce")
                            .font(.title3)
                        Toggle(isOn: $isDarkMode, label: {
                            
                        })
                        .tint(.myprimary)
                    }
                        
                        Button {
                            openSettings()
                        } label: {
                            
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


                        HStack {
                            
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
                    .frame(height: 430)
                }
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
                .bold()
                .padding()
                .foregroundStyle(.white)
                .background(RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(.red)
                    .frame(width: 500)
                )
        }
        Spacer()
        
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
            
            ToolbarItem(placement: .principal) {
                    Text("System settings")
                        .font(.title)
                        .bold()
                        .foregroundStyle(.color)
                }
        }
    }
    func openSettings() {
        guard let settingsURL = URL(string: UIApplication.openSettingsURLString) else { return }

        if UIApplication.shared.canOpenURL(settingsURL) {
            UIApplication.shared.open(settingsURL)
        }
    }
}

#Preview {
    ProfileView(appUser: .constant(.init(uid: "1234", email: "Moha@example.com")))
}
