//
//  BackButton.swift
//  Raseed
//
//  Created by ABDULRAHMAN AL-KHALED on 25/12/2023.
//

import SwiftUI

struct BackButton: View {
    var body: some View {
      
        
                Image(systemName: "arrow.left")
                   .resizable()
                    .scaledToFit()
                    .frame(width: 20)
                    .padding()
                    .background(.back)
                    .clipShape(Circle())
                   .shadow(color: .gray.opacity(0.5),radius: 5)
                   .padding(.leading)
           }
        }

#Preview {
    BackButton()
}
