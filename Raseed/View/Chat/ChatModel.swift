//
//  ChatModel.swift
//  Raseed
//
//  Created by ABDULRAHMAN AL-KHALED on 24/12/2023.
//

import Foundation

struct ChatModel: Identifiable {
    var id: UUID { person.id  }
    let person: Person
    var messages: [Message]
    var hasUnreadMessage = false
}

struct Person: Identifiable {
    let id = UUID()
    let name: String
    let imgString: String
}

struct Message: Identifiable {
    
    enum  MessageType {
         case Sent, Received
    }

    let id = UUID()
    let date: Date
    let text: String
    let type: MessageType
    
    init(_ text: String, type: MessageType, date: Date) {
        self.date = date
        self.type = type
        self.text = text
    }
    
    init(_ text: String, type: MessageType) {
        self.init(text, type: type, date: Date())
    }
}

extension ChatModel {
    
    static let sampleChat = [
        ChatModel(person: Person(name:"Rayan Meshal", imgString: "person"), messages: [Message("Good evening, Abdullah", type: .Received, date: Date(timeIntervalSinceNow: -86480 * 3))], hasUnreadMessage: true)
       
    ]
    
    static let sampleChat2 = [
        ChatModel(person: Person(name:"Talal Abdullah", imgString: "person"), messages: [Message("Good evening", type: .Received, date: Date(timeIntervalSinceNow: -86480 * 0))], hasUnreadMessage: true)
      
    ]
}
