//
//  ChatView.swift
//  Raseed
//
//  Created by ABDULRAHMAN AL-KHALED on 23/12/2023.
//


import SwiftUI

struct ChatView2: View {
    @State private var messageText = ""
    @State var messages: [String] = ["Hi there! I'm your courier, and I'm on my way to deliver your package. Are you in the delivery loction?"]
    
    var body: some View {
        VStack {
            HStack {
                Text("Chat")
                    .bold()
                    .font(.title)
            }
            //.padding()
            
            
            ScrollView {
                ForEach(messages, id: \.self) { index in
                    if index.contains("[USER]") {
                        let newIndex = index.replacingOccurrences(of: "[USER]", with: "")
                        HStack {
                            Spacer()
                            Text(newIndex)
                                .padding()
                                .foregroundStyle(.white)
                                .background(.myprimary)
                                .cornerRadius(10)
                                .padding(.horizontal, 16)
                                .padding(.bottom, 10)
                        }
                    } else {
                        HStack {
                            Text(index)
                                .padding()
                                .foregroundStyle(.color1)
                                .background(.color2)
                                .cornerRadius(10)
                                .padding(.horizontal, 16)
                                .padding(.bottom, 10)
                            Spacer()
                        }
                    }
                }.rotationEffect(.degrees(180))
            }.rotationEffect(.degrees(180))
                .background(.gray.opacity(0.1))
            HStack {
                TextField("Enter the message", text: $messageText)
                    .padding()
                    .background(.gray.opacity(0.1))
                    .cornerRadius(25)
                    .onSubmit {
                        sendMessage(message: messageText)
                    }
                
                Button {
                    sendMessage(message: messageText)
                } label: {
                    Image(systemName: "arrow.forward")
                        .foregroundStyle(.white)
                        .padding()
                        .background(Circle()
                            .foregroundStyle(.myprimary)
                                    )
                }

            }
            .padding(.horizontal)
        }
    }
    
    func sendMessage(message: String) {
        withAnimation {
            messages.append("[USER]" + message)
            self.messageText = ""
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation {
                messages.append(getResponse(message: message))
            }
        }
    }
}

#Preview {
    ChatView2()
}
