//
//  TetendViewModelEmployee.swift
//  Raseed
//
//  Created by ABDULRAHMAN AL-KHALED on 25/12/2023.
//

import Foundation
class TetendViewModelEmployee : ObservableObject {
    
    @Published var attendance: [AttendModelEmployee] = [
        AttendModelEmployee(name: "Ahmed Ali", clas: "Kg3",OnTab: false),
        AttendModelEmployee(name: "Khalid Ali", clas: "Kg1",OnTab: false),
        AttendModelEmployee(name: "Fahad Ali", clas: "Kg2",OnTab: false),
    ]
}
