//
//  PasswordFieldView.swift
//  Raseed
//
//  Created by ABDULRAHMAN AL-KHALED on 24/12/2023.
//

import SwiftUI

struct PasswordFieldView: View {
    @Binding var text: String
    
    var body: some View {
        VStack {
            Text("Password")
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            SecureField("Password", text: $text)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20)
                    .fill(.myprimary.opacity(0.1))
                            )
                .overlay {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color(uiColor: .myprimary), lineWidth: 0.3)
                }
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
        }
    }
}
    #Preview {
        PasswordFieldView(text: .constant(""))
    }

