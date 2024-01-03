//
//  ChatRowView.swift
//  Raseed
//
//  Created by ABDULRAHMAN AL-KHALED on 24/12/2023.
//

import SwiftUI

struct ChatRowView: View {
    let chat: ChatModel
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: chat.person.imgString)
                .resizable()
                .frame(width: 30, height: 30)
                .padding()
                .background(Circle()
                    .foregroundStyle(.gray.opacity(0.3))
                )
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text(chat.person.name)
                        .bold()
                        .lineLimit(1)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer()
                    Text(chat.messages.last?.date.descriptiveString() ?? "")
                    
                }
                HStack {
                    Text(chat.messages.last?.text ?? "")
                        .foregroundStyle(.gray)
                        .lineLimit(1)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.trailing, 40)
                    
                    
                    
                    Circle()
                        .foregroundStyle(chat.hasUnreadMessage ? .blue : .clear)
                        .frame(width: 10, height: 10)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
            }
        }
       // .frame(height: 80)
    }
}

#Preview {
    ChatRowView(chat: ChatModel.sampleChat[0])
}
