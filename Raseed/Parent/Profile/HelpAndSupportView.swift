//
//  HelpAndSupportView.swift
//  Raseed
//
//  Created by ABDULRAHMAN AL-KHALED on 25/12/2023.
//

import SwiftUI


struct HelpAndSupportView: View {
    @Environment(\.dismiss) var dismiss
    @State var Q1Expanded = false
    @State var Q2Expanded = false
    @State var Q3Expanded = false
    @State var Q4Expanded = false
    @State var Q5Expanded = false
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    NavigationLink {
                        Text("")
                    } label: {
                       
                        
                    }.foregroundColor(.black)
                    
                    Text("Help & Support")
                        .font(.title2)
                  
                }
               
                DisclosureGroup("what is Attendance App?", isExpanded: $Q1Expanded){
                    VStack{
                        Text("Creating an attendance app for schools involves building a system that allows parents and teachers to manage and track student attendance.")
                            .foregroundColor(.gray)
                    }
                    
                }.padding()
                    .foregroundColor(.gray)
                
                Divider()
                    .background(.gray)
                    .padding(.horizontal)
                
                DisclosureGroup("How can I chick out to my children", isExpanded: $Q2Expanded){
                    VStack{
                        Text("The parent sends a notification to the teacher regarding their presence outside, and the notification with the parent's information and the student's details will appear for the teacher. The student safely exits the school.")
                            .foregroundColor(.gray)
                    }
                    
                }.padding()
                    .foregroundColor(.gray)
                
                Divider()
                    .background(.gray)
                    .padding(.horizontal)
                
                DisclosureGroup("How I can use application?", isExpanded: $Q3Expanded){
                    VStack{
                        Text("This scenario describes a system where a parent can use a mobile application or another means to notify a teacher that they are present outside the school. The teacher receives a notification containing information about the parent and details about the specific student")
                            .foregroundColor(.gray)
                    }
                    
                }.padding()
                    .foregroundColor(.gray)
                
                Divider()
                    .background(.gray)
                    .padding(.horizontal)
                
              //  DisclosureGroup("qusiton", isExpanded: $Q4Expanded){
                 //   VStack{
                      //  Text("answer")
                         //   .foregroundColor(.gray)
                  //  }
                    
               // }.padding()
                    //.foregroundColor(.gray)
                
                    .background(.gray)
                    .padding(.horizontal)
                
                DisclosureGroup("I have a problem with my account", isExpanded: $Q5Expanded){
                    VStack{
                        Text("Sorry to hear that, you can contact us on our Email: \nattendanceApp@email.com")
                            .foregroundColor(.gray)
                            .tint(.gray)
                    }
                    
                }.padding()
                    .foregroundColor(.gray)
                
                Divider()
                    .background(.gray)
                    .padding(.horizontal)
                
                Spacer()
            }
        }.navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image(systemName: "chevron.backward")
                            .foregroundStyle(.gray)
                    }
                           
                    )
                }
            }
        //}
    }
}

#Preview {
    HelpAndSupportView()
}
