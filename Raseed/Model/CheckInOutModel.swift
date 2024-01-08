//
//  CheckInOutModel.swift
//  Raseed
//
//  Created by ABDULRAHMAN AL-KHALED on 31/12/2023.
//

import Foundation

// MARK: For parent
struct CheckOut: Identifiable, Codable {
    var id: UUID
    var parent_id: [Privilege]
    var teacher_id: [Privilege]
    var child_id:   [Childern]
    var creared_at: Date
}

// MARK: For employee
struct CheckIn: Identifiable, Codable {
    var id: String
    var parent_id: [Privilege]
    var teacher_id: [Privilege]
    var child_id: [Childern]
    var created_at: Date
}

struct Privilege: Identifiable, Codable {
    var id: String
    var userID: String
    var name: String
    var userType: String
    var contact: String
}

struct Childern: Identifiable, Codable {
    let id: String
    var name: String
    var parent_id: String
    var teacher_id: String
    var grade: String
}
