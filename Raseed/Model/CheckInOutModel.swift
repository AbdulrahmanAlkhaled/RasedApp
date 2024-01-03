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
    var parent_id:  String//[Privilege]
    var teacher_id: String//[Privilege]
    var child_id:   String//[Childern]
}

// MARK: For employee
struct CheckIn: Identifiable, Codable {
    var id: String
    var parent_id: String
    var teacher_id: String
    var child_id: String
}

//struct Privilege: Identifiable, Codable {
//    var id: String
//    var userID: String
//    var name: String
//    var userType: String
//    var contact: String
//}

struct Childern: Identifiable, Codable {
    let id: String
    var name: String
    var parent_id: String
    var teacher_id: String
    var grade: String
}
