//
//  EmailFieldView.swift
//  Raseed
//
//  Created by ABDULRAHMAN AL-KHALED on 24/12/2023.
//

import SwiftUI

struct EmailFieldView: View {
    @Binding var text: String
    
    var body: some View {
        VStack {
            Text("Email")
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            TextField("Email Address",text: $text)
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
    EmailFieldView(text: .constant(""))
}
