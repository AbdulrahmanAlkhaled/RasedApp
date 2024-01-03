//
//  IDFieldview.swift
//  Raseed
//
//  Created by ABDULRAHMAN AL-KHALED on 23/12/2023.
//

import SwiftUI

struct IDFieldview: View {
    @Binding var text: String
    
    var body: some View {
        VStack {
            Text("ID")
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            TextField("ID number", text: $text)
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
    IDFieldview(text: .constant(""))
}
