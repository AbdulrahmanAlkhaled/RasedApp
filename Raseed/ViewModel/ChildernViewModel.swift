//
//  ChildernViewModel.swift
//  Raseed
//
//  Created by ABDULRAHMAN AL-KHALED on 31/12/2023.
//

import Foundation
import Supabase

class ChildernViewModel: ObservableObject {
    @Published var childerns: [Childern] = []
    
    
    let supabase = SupabaseClient(supabaseURL: "https://odcwcefhsryccbgngqns.supabase.co", supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9kY3djZWZoc3J5Y2NiZ25ncW5zIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDM0OTkzMjUsImV4cCI6MjAxOTA3NTMyNX0.y2kKkvF6_VuOZsljeuL2t7tlhUV3epVyoXsWNeLZoXo")
    
    
    // MARK: - GET Check out operation in teacher view
    func getData() async {
        do {
            let postgrestResponse = try await supabase.database.from("Childern").select().execute()
            
            let decoder = JSONDecoder()
            
            let decodedData = try decoder.decode([Childern].self, from: postgrestResponse.data)
            DispatchQueue.main.sync {
                childerns = decodedData
            }
        } catch {
            print(error)
        }
    }
}
