//
//  ChatViewModel.swift
//  Raseed
//
//  Created by ABDULRAHMAN AL-KHALED on 23/12/2023.
//

import Foundation

func getResponse(message: String) -> String {
    let tempMessage = message.lowercased()
    
    if tempMessage.contains("yes, i am") {
        return "Good, I am coming"
    }
    else if tempMessage.contains("call me when you arrive") {
        return "ok"
    }
    else if tempMessage.contains("طيب تكلم عربي") {
        return "ابشر"
    } else {
        return "I don't get you"
    }
}

class ChatViewModel: ObservableObject {
    
    
    @Published var chats = ChatModel.sampleChat

    @Published var items = [
        Model(id: "1122", name: "Abdulrahman Khaled", major:"Math", Contact: "0552552450"),
        Model(id: "2233", name: "Abdulrahman Talal", major:"Computer", Contact: "0554562450"),
        Model(id: "3344", name: "Fahad Rayan", major:"Chemical", Contact: "055255320"),
        Model(id: "4466", name: "Khalid Ali", major:"Chemical", Contact: "055264320"),
        Model(id: "3377", name: "Mohammed Yasser", major:"Chemical", Contact: "0552462450"),
        Model(id: "8844", name: "Naif Waleed", major:"Chemical", Contact: "05525339450")
    ]
    
    @Published var chat = [
        ChatModels(name: "Abdulrahman Khaled", text: "Hi, How are you today", Contact: "0398383983", date: "10/04/2023"),
//        ChatModel(name: "Khaled Abdulrahman", text: "Hi, How are you today", Contact: "0398383983", date: "10/04/2023"),
//        ChatModel(name: "Talal Rayan", text: "Hi, How are you today", Contact: "0398383983", date: "10/04/2023"),
//        ChatModel(name: "Yasser Nasser", text: "Hi, How are you today", Contact: "0398383983", date: "10/04/2023"),
//        ChatModel(name: "Khaled Fahad", text: "Hi, How are you today", Contact: "0398383983", date: "10/04/2023"),
    ]

    func getSortedfilteredChats(query: String)-> [ChatModel] {
        let sortedChats = chats.sorted {
            guard let date1 = $0.messages.last?.date else { return false }
            guard let date2 = $1.messages.last?.date else { return false }
            return date1 > date2
        }
        
        if query == "" {
            return sortedChats
        }
        return sortedChats.filter { $0.person.name.lowercased().contains(query.lowercased()) }
    }
    
    func getSectionMessage(for chat: ChatModel)-> [[Message]] {
        var res = [[Message]]()
        var tmp = [Message]()
        for message in chat.messages {
           if let firstMessage = tmp.first {
               let daysBetween = firstMessage.date.daysBetween(date: message.date)
               if daysBetween >= 1 {
                   res.append(tmp)
                   tmp.removeAll()
                   tmp.append(message)
               } else {
                   tmp.append(message)
               }
           } else {
               tmp.append(message)
           }
        }
        res.append(tmp)
        return res
    }
    
    func markAsUnread(_ newValue: Bool, chat: ChatModel) {
        if let index = chats.firstIndex(where: { $0.id == chat.id }) {
            chats[index].hasUnreadMessage = newValue
        }
    }
    
    func sendMessage(_ text: String, in chat: ChatModel)-> Message? {
        if let index = chats.firstIndex(where: { $0.id == chat.id }) {
            let message = Message(text, type: .Sent)
            chats[index].messages.append(message)
            return message
        }
        return nil
    }
}

class ChatView2Model: ObservableObject {
    
    @Published var chats2 = ChatModel.sampleChat2
    
    func getSortedfilteredChats(query: String)-> [ChatModel] {
        let sortedChats = chats2.sorted {
            guard let date1 = $0.messages.last?.date else { return false }
            guard let date2 = $1.messages.last?.date else { return false }
            return date1 > date2
        }
        
        if query == "" {
            return sortedChats
        }
        return sortedChats.filter { $0.person.name.lowercased().contains(query.lowercased()) }
    }
    
    func getSectionMessage(for chat: ChatModel)-> [[Message]] {
        var res = [[Message]]()
        var tmp = [Message]()
        for message in chat.messages {
           if let firstMessage = tmp.first {
               let daysBetween = firstMessage.date.daysBetween(date: message.date)
               if daysBetween >= 1 {
                   res.append(tmp)
                   tmp.removeAll()
                   tmp.append(message)
               } else {
                   tmp.append(message)
               }
           } else {
               tmp.append(message)
           }
        }
        res.append(tmp)
        return res
    }
    
    func markAsUnread(_ newValue: Bool, chat: ChatModel) {
        if let index = chats2.firstIndex(where: { $0.id == chat.id }) {
            chats2[index].hasUnreadMessage = newValue
        }
    }
    
    func sendMessage(_ text: String, in chat: ChatModel)-> Message? {
        if let index = chats2.firstIndex(where: { $0.id == chat.id }) {
            let message = Message(text, type: .Sent)
            chats2[index].messages.append(message)
            return message
        }
        return nil
    }
}
