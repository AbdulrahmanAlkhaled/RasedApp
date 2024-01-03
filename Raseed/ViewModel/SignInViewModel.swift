//
//  SignInViewModel.swift
//  Raseed
//
//  Created by ABDULRAHMAN AL-KHALED on 31/12/2023.
//

import Foundation
import Supabase


@MainActor
class SignInViewModel: ObservableObject {
    @Published var auth: [AppUser] = []
    
    
    func isFormValid(email: String, password: String) -> Bool {
        guard email.isValidEmail(), password.count > 5 else{
            return false
        }
        return true
    }
    
    
    
    func registerNewUserWithEmail(email: String, password: String) async throws -> AppUser {
        if isFormValid(email: email, password: password) {
            return try await AuthManager.shared.registerNewUserWithEmail(email: email, password: password)
        }else {
            print("Registeration Form is invalid")
            throw NSError()
        }
    }
    
    
    func signInWithEmail(email: String, password: String) async throws -> AppUser{
        if isFormValid(email: email, password: password) {
            return try await AuthManager.shared.signInWithEmail(email: email, password: password)
        }else {
            print("Sign in Form is invalid")
            throw NSError()
        }
    }
}
extension String{
    func isValidEmail() -> Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: self)
    }
}
