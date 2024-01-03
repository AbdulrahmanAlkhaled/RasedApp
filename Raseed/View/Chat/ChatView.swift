//
//  ChatView.swift
//  Raseed
//
//  Created by ABDULRAHMAN AL-KHALED on 24/12/2023.
//

import SwiftUI
import Supabase 
struct ChatView: View {
    
    @EnvironmentObject var vm: ChatViewModel
    let chat: ChatModel
    @Environment(\.dismiss) var dismiss

    @State private var text = ""
    @FocusState private var isFocused
    
    @State private var messageIDToScroll: UUID?
    
    var body: some View {
        VStack(spacing: 0) {
            GeometryReader { reader in
                ScrollView {
                    ScrollViewReader { scrollReader in
                        getMessagesView(viewWidth: reader.size.width)
                            .padding(.horizontal)
                            .onChange(of: messageIDToScroll) { _ in
                                if let messageID = messageIDToScroll {
                                    scrollTo(messageID: messageID, shouldAnimate: true, scrollReader: scrollReader)
                                }
                            }
                            .onAppear {
                                if let messageID = chat.messages.last?.id {
                                    scrollTo(messageID: messageID, anchor: .bottom, shouldAnimate: false, scrollReader: scrollReader)
                                }
                            }
                    }
                }
            }
            .padding(.bottom, 5)
            .background(.gray.opacity(0.2))
            toolBarView()
        }
        
        .padding(.top, 1)
        .navigationBarTitleDisplayMode(.inline)
        .tint(.red)
        .navigationBarItems(leading: navBar)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image(systemName: "chevron.backward")
                            .foregroundStyle(.gray)
                    }
                           
                    )
                }
            
           
        }
        .onAppear {
            vm.markAsUnread(false, chat: chat)
        }
    }
    
    var navBar: some View {
            
            Text(chat.person.name)
                .bold()
    }
    
    func scrollTo(messageID: UUID, anchor: UnitPoint? = nil, shouldAnimate: Bool, scrollReader: ScrollViewProxy) {
        DispatchQueue.main.async {
            withAnimation(shouldAnimate ? Animation.easeIn : nil) {
                scrollReader.scrollTo(messageID, anchor: anchor)
            }
        }
    }
    func toolBarView()-> some View {
        VStack {
            let height: CGFloat = 37
            HStack {
                TextField("Enter the message", text: $text)
                    .padding(.horizontal, 10)
                    .frame(height: height)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 13))
                    .focused($isFocused)
                
                Button(action: sendMessage ) {
                    Image(systemName: "arrow.forward")
                        .foregroundStyle(.white)
                        .padding()
                        .background(
                            Circle()
                                .foregroundStyle(text.isEmpty ? .gray.opacity(0.7) : .myprimary)
                        )
                }
                .disabled(text.isEmpty)
            }
            .frame(height: height)
        }
        .padding(.vertical)
        .padding(.horizontal)
        .background(.thickMaterial)
        
    }
    
    func sendMessage() {
        if let message = vm.sendMessage(text, in: chat) {
            text = ""
            messageIDToScroll = message.id
        }
    }
    let columns = [GridItem(.flexible(minimum: 10))]
    
    func getMessagesView(viewWidth: CGFloat)-> some View {
        LazyVGrid(columns: columns, spacing: 0, pinnedViews: [.sectionHeaders]) {
            let sectionMessages = vm.getSectionMessage(for: chat)
            ForEach(sectionMessages.indices, id: \.self) { sectionIndex in
                let messages = sectionMessages[sectionIndex]
                Section(header: sectionHeader(firstMessage: messages.first!)) {
                    ForEach(messages) { message in
                        let isRecived = message.type == .Received
                        HStack {
                            ZStack{
                                Text(message.text)
                                    .padding(.horizontal)
                                    .padding(.vertical, 12)
                                    .background(isRecived ? Color.black.opacity(0.2) : .myprimary)
                                    .cornerRadius(13)
                            }
                            .frame(width: viewWidth * 0.7, alignment: isRecived ? .leading : .trailing)
                            .padding(.vertical)
                        }
                        .frame(maxWidth: .infinity, alignment: isRecived ? .leading : .trailing)
                        .id(message.id) // important for automatic scrolling later.
                    }
                }
            }
        }
    }
    func sectionHeader(firstMessage message: Message) -> some View {
        ZStack{
            Text(message.date.descriptiveString(dataStyle: .medium))
                .foregroundStyle(.white)
                .font(.system(size: 14, weight: .regular))
                .frame(width: 120)
                .padding(.vertical, 5)
                .background(Capsule().foregroundStyle(Color.gray.opacity(0.6)))
        }
        .padding(.vertical, 5)
        .frame(maxWidth: .infinity)
    }
}

#Preview {
        ChatView(chat: ChatModel.sampleChat[0])
            .environmentObject(ChatViewModel())
}
