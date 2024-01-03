//
//  ParentView.swift
//  Raseed
//
//  Created by ABDULRAHMAN AL-KHALED on 24/12/2023.
//

import SwiftUI

struct ParentView: View {
    var body: some View {
        
        NavigationLink(destination: ContentView()) {
            Text("Sign in as parent")
                .foregroundStyle(.white)
                .bold()
                .padding()
                .background(RoundedRectangle(cornerRadius: 25)
                    .frame(width: .infinity)
                    .frame(width: 360)                    .foregroundStyle(Color.myprimary)
                )
        }.navigationBarBackButtonHidden(true)
    }
}
#Preview {
    ParentView()
}
