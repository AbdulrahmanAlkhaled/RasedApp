//
//  ShowMassege.swift
//  Raseed
//
//  Created by ABDULRAHMAN AL-KHALED on 25/12/2023.
//

import SwiftUI

struct ShowMassege: View {
    
        @State var Q1Expanded = false
        @State var Q2Expanded = false
        @State var Q3Expanded = false
        @State var Q4Expanded = false
        @State var Q5Expanded = false
        var body: some View {
         
               VStack{
                 
                      // NavigationLink {
                      //     Text("")
                      // } label: {
                       //    BackButton()
                           
                     //  }.foregroundColor(.black)
                       
                       Text("All Requestes")
                           .font(.title2)
                       
                 
                   DisclosureGroup("from:Ahmed@htmail.com", isExpanded: $Q1Expanded){
                       VStack{
                           Text(
                                "**state**:hgfhfhfh hhfhfh\n **reson**:cfdfgdcfggfhfhfhfhgggfh\nhghfgfgfgfgfgh")
                               .foregroundColor(.black)
                       }
                       
                   }.padding()
                       .foregroundColor(.black)
                   
                   Divider()
                       .background(.gray)
                       .padding(.horizontal)
                   
                   DisclosureGroup("from:Ahmed@htmail.com", isExpanded: $Q2Expanded){
                       VStack{
                           Text("answer.")
                               .foregroundColor(.gray)
                       }
                       
                   }.padding()
                       .foregroundColor(.gray)
                   
                   Divider()
                       .background(.gray)
                       .padding(.horizontal)
                   
                   DisclosureGroup("from:Ahmed@htmail.com", isExpanded: $Q3Expanded){
                       VStack{
                           Text("...")
                               .foregroundColor(.gray)
                       }
                       
                   }.padding()
                       .foregroundColor(.gray)
                   
                   Divider()
                       .background(.gray)
                       .padding(.horizontal)
                   
                   DisclosureGroup("from:Ahmed@htmail.com", isExpanded: $Q4Expanded){
                       VStack{
                           Text("answer")
                               .foregroundColor(.gray)
                       }
                       
                   }.padding()
                       .foregroundColor(.gray)
                   
                   Divider()
                       .background(.gray)
                       .padding(.horizontal)
                   
                   DisclosureGroup("from:Ahmed@htmail.com", isExpanded: $Q5Expanded){
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
    }
}

#Preview {
    ShowMassege()
}
