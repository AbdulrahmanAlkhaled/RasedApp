//
//  RaseedApp.swift
//  Raseed
//
//  Created by ABDULRAHMAN AL-KHALED on 22/12/2023.
//

import SwiftUI

@main
struct RaseedApp: App {
   
    @AppStorage("isDarkMode") private var isDarkMode = false
    var body: some Scene {
        WindowGroup {
            OnboardingView()
                .preferredColorScheme(isDarkMode ? .dark : .light)
            
        }
    }
}
