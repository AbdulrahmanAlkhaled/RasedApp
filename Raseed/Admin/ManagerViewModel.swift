//
//  ManagerViewModel.swift
//  Raseed
//
//  Created by ABDULRAHMAN AL-KHALED on 04/01/2024.
//

import Foundation
import Supabase

class ManagerViewModel: ObservableObject {
    @Published var access: [AdminAccess] = []
    @Published var titleTextField = ""
    @Published var titleTextField2 = ""
    @Published var titleTextField3 = ""
    
    let supabase = SupabaseClient(supabaseURL: "https://odcwcefhsryccbgngqns.supabase.co", supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9kY3djZWZoc3J5Y2NiZ25ncW5zIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDM0OTkzMjUsImV4cCI6MjAxOTA3NTMyNX0.y2kKkvF6_VuOZsljeuL2t7tlhUV3epVyoXsWNeLZoXo")
    
    
   
    func fetchData() async {
        do {
            let postgrestResponse = try await supabase.database.from("AdminAccess").select().execute()
            
            let decoder = JSONDecoder()
            
            let decodedData = try decoder.decode([AdminAccess].self, from: postgrestResponse.data)
            DispatchQueue.main.sync {
                access = decodedData
            }
        } catch {
            print(error)
        }
//        supabase.realtime.connect()
//
//        supabase.realtime.channel("public")
//            .on("postgres_changes", filter: ChannelFilter(event: "INSERT", schema: "public", table: "table")) { message in
//                print("payload", message.payload)
//            }
//            .subscribe()
//
//
//        DispatchQueue.main.asyncAfter(deadline: .now().advanced(by: .seconds(10))) {
//            print("Inserting to database\n\n\n")
//            Task(operation: self.fetchData)
//        }
    }
    
    func addData() async {
        do {
            let tempToDo =  AdminAccess(teacher_id: titleTextField, name: titleTextField2, contact: titleTextField3)
            // 1- add to local data
            DispatchQueue.main.sync {
                access.append(tempToDo)
            }
            
            // 2- add to database
            try await supabase.database.from("AdminAccess").insert(tempToDo).execute()
        } catch {
            print(error)
        }
    }
    
    func deleteData(index: Int) async {
        do {
            var removedToDo: AdminAccess?
            // 1- delete from local data
            DispatchQueue.main.sync {
                removedToDo = access.remove(at: index)
            }
            
            // 2- delte from database
            try await supabase.database.from("AdminAccess").delete().eq("id", value: removedToDo!.teacher_id).execute()
        }catch{
            print(error)
        }
    }
}
