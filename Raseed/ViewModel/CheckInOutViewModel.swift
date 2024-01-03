//
//  CheckInOutViewModel.swift
//  Raseed
//
//  Created by ABDULRAHMAN AL-KHALED on 31/12/2023.
//

import Foundation
import Supabase

class CheckInOutViewModel: ObservableObject {
    
    
    @Published var checkout: [CheckOut] = []
    @Published var checkin: [CheckIn] = []
    
    
    let supabase = SupabaseClient(supabaseURL: "https://odcwcefhsryccbgngqns.supabase.co", supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9kY3djZWZoc3J5Y2NiZ25ncW5zIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDM0OTkzMjUsImV4cCI6MjAxOTA3NTMyNX0.y2kKkvF6_VuOZsljeuL2t7tlhUV3epVyoXsWNeLZoXo")
    
    
    // MARK: - GET Check out operation in teacher view
    func fetchData() async {
        do {
            let postgrestResponse = try await supabase.database.from("CheckOut").select().execute()
            
            let decoder = JSONDecoder()
            
            let decodedData = try decoder.decode([CheckOut].self, from: postgrestResponse.data)
            DispatchQueue.main.sync {
                checkout = decodedData
            }
        } catch {
            print(error)
        }
        
        
        supabase.realtime.connect()
        
        supabase.realtime.channel("public")
            .on("postgres_changes", filter: ChannelFilter(event: "INSERT", schema: "public", table: "table")) { message in
                print("payload", message.payload)
            }
            .subscribe()
        
        
        DispatchQueue.main.asyncAfter(deadline: .now().advanced(by: .seconds(10))) {
            print("Inserting to database\n\n\n")
            Task(operation: self.addData)
        }
        
    }
    
    // MARK: - POST Check out operation in parent view
    func addData() async {
        do {
            let checkOut = CheckOut(id: UUID(), parent_id: "8ca8c518-b20f-4275-91f1-b7be3eda2e66", teacher_id: "81845307-4ebd-48eb-a7ac-ae9092d4f1ee", child_id: "5b5999ce-84f5-496e-89fa-1ba1db6d09a6")
            // 1- add to local data
            DispatchQueue.main.sync {
                checkout.append(checkOut)
            }
            
            // 2- add to database
            try await supabase.database.from("CheckOut").insert(checkOut).execute()
        } catch {
            print(error)
        }
    }
    
    
    // MARK: - GET Check in operation in parent view
    func fetchData2() async {
        do {
            let postgrestResponse = try await supabase.database.from("CheckIn").select().execute()
            
            let decoder = JSONDecoder()
            
            let decodedData = try decoder.decode([CheckIn].self, from: postgrestResponse.data)
            DispatchQueue.main.sync {
                checkin = decodedData
            }
        } catch {
            print(error)
        }
        
        
        supabase.realtime.connect()
        
        supabase.realtime.channel("public")
            .on("postgres_changes", filter: ChannelFilter(event: "INSERT", schema: "public", table: "table")) { message in
                print("payload", message.payload)
            }
            .subscribe()
        
        
        DispatchQueue.main.asyncAfter(deadline: .now().advanced(by: .seconds(10))) {
            print("Inserting to database\n\n\n")
            Task(operation: self.addData2)
        }
        
    }
    
    
    // MARK: - POST Check in operation in teacher view
    func addData2() async {
        do {
            let checkIn = CheckOut(id: UUID(), parent_id: "cfdd4c2d-e246-4b80-bc89-03ef5f282c01", teacher_id: "435dc217-3e76-4c57-a444-c11c92c8fa08", child_id: "0897fe12-2c2e-49f8-96cf-9bb7d901da9b")
            // 1- add to local data
            DispatchQueue.main.sync {
                checkout.append(checkIn)
            }
            
            // 2- add to database
            try await supabase.database.from("CheckIn").insert(checkIn).execute()
        } catch {
            print(error)
        }
    }
    
}
    
    
    
    
    
    
// Real-time in 'CheckOut' table
//        supabase.realtime.connect()
//
//        supabase.realtime.channel("public")
//          .on("postgres_changes", filter: ChannelFilter(event: "INSERT", schema: "public")) { payload in
////              let record = payload.data.record // == Dictionary<String, Any>
//              // record["id"]
//              // record["parent_id"]
//              // record["teacher_id"]
//              // self.checkout.append(newRecord)
//          }

//        supabase.realtime.logger = {
//            print("SUPABASE", $0)
//        }

//            .on("postgres_changes", filter: ChannelFilter(event: "INSERT", schema: "public")) { payload in
//                 let record = payload.data?["record"] as? [String: Any]
//                    // Access fields in the record
//                     let id = record["id"]
//                       let parentId = record["parent_id"]
//                       let teacherId = record["teacher_id"]
//                        // Create a new record with extracted values
//                        let newRecord = CheckOut(id: id, parentId: parentId, teacherId: teacherId)
//
//                        // Append the new record to the 'checkout' array
//                        self.checkout.append(newRecord)
//                }
