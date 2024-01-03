//
//  MasseageView.swift
//  Raseed
//
//  Created by ABDULRAHMAN AL-KHALED on 25/12/2023.
//

import SwiftUI

struct MasseageView: View {
    @State var state = ""
    @State var reson = ""
    var body: some View {
        
         VStack{
            
             HStack{
                 
                 Image(systemName: "square.and.pencil").resizable().scaledToFit().frame(width:40,height: 40).foregroundColor(.col1)
              
                 Text("Add New requist").font(.title3).foregroundStyle(.col1).underline()
             }
         }.frame(maxWidth:.infinity,alignment: .leading).padding()
         
         VStack(alignment: .leading){
             Text("State")
                 .padding(.bottom)
             
             TextField("state", text: $state)
                 .padding(.leading)
                 .background(RoundedRectangle(cornerRadius: 15)
                     .fill(.back)
                     .stroke(.col1.opacity(0.5))
                     .frame(height: 50))
             
           
             
         }.frame(maxWidth: .infinity,alignment: .leading)
             .padding()
         
         
         VStack(alignment: .leading){
             Text("Reson").frame(maxWidth:.infinity,alignment: .leading).padding()
             TextField("reson", text: $reson)
                 .padding(.leading)
                 .background(RoundedRectangle(cornerRadius: 15)
                     .fill(.back)
                     .stroke(.col1.opacity(0.5))
                     .frame(width:330,height: 100)).padding()
             
             
         }.frame(maxWidth: .infinity,alignment: .leading)
             .padding()
        
         
         Button(action: {}, label: {
            RoundedRectangle(cornerRadius: 20)
                 .frame(maxWidth: .infinity,maxHeight: 55)
                 .foregroundColor(.col1)
                 .padding()
                 
                 .overlay {
                     Text("Send")
                         .foregroundColor(.white)
                         .bold()
                         .font(.title3)
                 }
         }).padding(.top)
    }
}

#Preview {
    MasseageView()
}
