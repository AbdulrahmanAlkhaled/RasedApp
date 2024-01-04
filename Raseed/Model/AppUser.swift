//
//  PrivilegeModel.swift
//  Raseed
//
//  Created by ABDULRAHMAN AL-KHALED on 31/12/2023.
//

import Foundation

struct AppUser {
    let uid: String
    let email: String?
}

struct AdminAccess:  Codable {
    var teacher_id: String
    var name: String
    var contact: String
}
