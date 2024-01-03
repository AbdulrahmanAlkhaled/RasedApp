//
//  NotifcationEmpViewModel.swift
//  Raseed
//
//  Created by ABDULRAHMAN AL-KHALED on 25/12/2023.
//

import Foundation
class NotifcationEmpViewModel: ObservableObject {
    
    @Published var notifacate: [NotifcationEmpModel] = [
        NotifcationEmpModel(name: "Abullah Khalaf", clas: "Parent of Talal Abdullah")
    ]
}
