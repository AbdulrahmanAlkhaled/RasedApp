//
//  ContentView.swift
//  Raseed
//
//  Created by ABDULRAHMAN AL-KHALED on 31/12/2023.
//

import SwiftUI

struct ContentView: View {
    @State var appUser: AppUser? = nil
    @Environment(\.dismiss) var dismiss

    var body: some View {
            ZStack{
                if let appUser = appUser {
                        ParentRootView(appUser: $appUser)
                            .navigationBarBackButtonHidden(true)
                }else {
                    SignInView( appUser: $appUser)
                }
                
            }
            .onAppear {
                Task {
                    self.appUser = try await AuthManager.shared.getCurrentSession()
                }
            }
            //        .navigationBarBackButtonHidden(true)
            //        .toolbar {
            //            ToolbarItem(placement: .topBarLeading) {
            //                Button(action: {
            //                    dismiss()
            //                }, label: {
            //                    Image(systemName: "chevron.backward")
            //                        .foregroundStyle(.gray)
            //                }
            //
            //                )
            //            }
            //        }
        }
    }


#Preview {
    ContentView(appUser: nil)
}
