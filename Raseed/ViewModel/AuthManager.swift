//
//  AuthManager.swift
//  Raseed
//
//  Created by ABDULRAHMAN AL-KHALED on 31/12/2023.
//

import Foundation
import Supabase


class AuthManager {
    static let shared = AuthManager()
    
    
    let client = SupabaseClient(supabaseURL: "https://odcwcefhsryccbgngqns.supabase.co", supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9kY3djZWZoc3J5Y2NiZ25ncW5zIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDM0OTkzMjUsImV4cCI6MjAxOTA3NTMyNX0.y2kKkvF6_VuOZsljeuL2t7tlhUV3epVyoXsWNeLZoXo")
    
    
    func getCurrentSession() async throws -> AppUser {
        let session = try await client.auth.session
        return AppUser(uid: session.user.id.uuidString, email: session.user.email)
    }
    // MARK: Sign up Function
    
    func registerNewUserWithEmail(email: String, password: String) async throws -> AppUser {
        let regAuthResponse = try await client.auth.signUp(email: email, password: password)
        guard let session = regAuthResponse.session else {
            print("no session when registering user")
            throw NSError()
        }
        return AppUser(uid: session.user.id.uuidString, email: session.user.email)
    }
    
    
    
    // MARK: Sign In function
    func signInWithEmail(email: String, password: String) async throws -> AppUser {
        let session = try await client.auth.signIn(email: email, password: password)
        return AppUser(uid: session.user.id.uuidString, email: session.user.email)
    }
    
    func signOut() async throws {
       try await client.auth.signOut()
    }
}
