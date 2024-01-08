//
//  textfield.swift
//  Raseed
//
//  Created by ABDULRAHMAN AL-KHALED on 25/12/2023.
//

import SwiftUI

struct Textfield: View {
    @State var isPresented = false
    var body: some View {
        
        Button(action: {
           
        }, label: {
            
            Image(systemName: "chevron.down.circle.fill").resizable().scaledToFit().frame(width:30,height:30).foregroundColor(.col1)
                    
                }
            )
        
       
        Button(action: {
           // self.show.toggle()
           
        }, label: {
           
            Image(systemName: "multiply").resizable().scaledToFit().frame(width:10,height: 20).foregroundColor(.col2)
            
        })
        
    }
}

#Preview {
    Textfield()
}
