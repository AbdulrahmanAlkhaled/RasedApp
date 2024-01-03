//
//  EmployeeView.swift
//  Raseed
//
//  Created by ABDULRAHMAN AL-KHALED on 24/12/2023.
//

import SwiftUI

struct EmployeeView: View {
    var body: some View {
        NavigationLink(destination: Content2View()) {
            Text("Sign in as employee")
                .foregroundStyle(.white)
                .bold()
                .padding()
                .background(RoundedRectangle(cornerRadius: 25)
                    .frame(width: .infinity)
                    .frame(width: 360)                 .foregroundStyle(Color.myprimary)
                )
        }
    }
}

#Preview {
    EmployeeView()
}
