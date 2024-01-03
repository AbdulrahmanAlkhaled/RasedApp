//
//  NotifcationViewModel.swift
//  Raseed
//
//  Created by ABDULRAHMAN AL-KHALED on 25/12/2023.
//

import Foundation
class NotifcationViewModel: ObservableObject {
    
    @Published var natifcation: [NotifactionModelParent] = [
        NotifactionModelParent(name: "Rayan Meshal", clas: "Teacher in Rawad school")
    ]
}
