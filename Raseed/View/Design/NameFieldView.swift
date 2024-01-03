//
//  NameFieldView.swift
//  Raseed
//
//  Created by ABDULRAHMAN AL-KHALED on 22/12/2023.
//

import SwiftUI

struct NameFieldView: View {
    @Binding var text: String
    
    var body: some View {
        VStack {
            Text("Name")
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            TextField("Full name", text: $text)
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
    NameFieldView(text: .constant(""))
}
