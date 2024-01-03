//
//  AttendanceViewModel.swift
//  Raseed
//
//  Created by ABDULRAHMAN AL-KHALED on 25/12/2023.
//

import Foundation
class AttendanceViewModel: ObservableObject {
    
    @Published var atten: [AttendanceModel] = [
        AttendanceModel(name: "Khalid Ali", clas: "KG 3", OnTab: false),
        AttendanceModel(name: "Ahmed Ali", clas: "KG 2", OnTab: false)
    ]
}
