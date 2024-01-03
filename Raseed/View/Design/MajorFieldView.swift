//
//  MajorFieldView.swift
//  Raseed
//
//  Created by ABDULRAHMAN AL-KHALED on 22/12/2023.
//

import SwiftUI

struct MajorFieldView: View {
    @Binding var text: String
    
    var body: some View {
        VStack {
            Text("Major")
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            TextField("Major", text: $text)
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
        }    }
}

#Preview {
    MajorFieldView(text: .constant(""))
}
