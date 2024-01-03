//
//  FilteringChatView.swift
//  Raseed
//
//  Created by ABDULRAHMAN AL-KHALED on 24/12/2023.
//

import SwiftUI

struct FilteringChatView: View {
    @StateObject var vm = ChatViewModel()
    // search bar
    @State private var searchText = ""
    
    @State private var query = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Chats")
                    .font(.title)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                
                    .offset(CGSize(width: 10.0, height: 10.0))
                HStack{
                    TextField("Search for a city ", text: $searchText)
                        .padding(.leading,25)
                }
                .padding(10)
                .background(Color(.systemGray6))
                .cornerRadius(25)
                .padding(.horizontal)
                .overlay(
                    Image(systemName: "magnifyingglass")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading,25)
                        .foregroundColor(.gray)
                )
            }
            List {
                ForEach(vm.getSortedfilteredChats(query: query)) { i in
                    
                    // Hide the disclosure arrow
                    ZStack {
                        
                        ChatRow2View(chat: i)
                        
                        NavigationLink(destination: {
                            Chat2View(chat: i)
                                .environmentObject(vm)
                        }) {
                            EmptyView()
                        }
                        .buttonStyle(PlainButtonStyle())
                        .frame(width: 0)
                        .opacity(0)
                    }
                    .swipeActions(edge: .leading, allowsFullSwipe: true) {
                        Button(action: {
                            vm.markAsUnread(true, chat: i)
                        }) {
                            if i.hasUnreadMessage {
                                Text("Read")
                            } else {
                                Text("Unread")
                            }
                        }
                        .tint(.blue)
                    }
                }
            }
        .listStyle(PlainListStyle())
//            .searchable(text: $query)
//            .navigationTitle("Chat")
//            .navigationBarItems(trailing: Button(action: {}) {
//                Image(systemName: "square.and.pencil")
//                    .foregroundStyle(.myprimary)
//            }
//            )
//            
        }
    }
    
}
#Preview {
    FilteringChatView()
}
