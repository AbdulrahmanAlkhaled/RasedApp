//
//  AdminView.swift
//  Raseed
//
//  Created by ABDULRAHMAN AL-KHALED on 04/01/2024.
//

import SwiftUI


struct AdminView: View {
    @State var appUser: AppUser? = nil
    @Environment(\.dismiss) var dismiss

    var body: some View {
       ZStack{
            if let appUser = appUser {
                Content3View(appUser: $appUser)

            }else {
                SignInView( appUser: $appUser)
            }
            
        }
        .onAppear {
            Task {
                self.appUser = try await AuthManager.shared.getCurrentSession()
            }
        }
    }
    
}

#Preview {
    AdminView(appUser: nil)
}
