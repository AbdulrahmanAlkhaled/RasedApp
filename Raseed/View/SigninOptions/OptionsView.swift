//
//  OptionsView.swift
//  Raseed
//
//  Created by ABDULRAHMAN AL-KHALED on 24/12/2023.
//

import SwiftUI
import Lottie
struct OptionsView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(spacing: 65) {
            LottieView(animation: .named("Animation4")).playing().looping()
                .resizable()
                .frame(height: 300)
            Text("Login to start the app.")
                .font(.title2)
                .bold()
                .multilineTextAlignment(.trailing)
            VStack(spacing: 15) {
                ParentView()
                EmployeeView()
            }
        }
    }
}

#Preview {
    OptionsView()
}
