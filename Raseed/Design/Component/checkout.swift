//
//  checkout.swift
//  Raseed
//
//  Created by ABDULRAHMAN AL-KHALED on 25/12/2023.
//

import SwiftUI

struct checkout: View {
    var body: some View {
        
        Button(action: {
            
        }, label: {
            
            Circle().scaledToFit().frame(width:100,height: 150).foregroundColor(.col2).overlay(
                VStack{
                    Image(systemName: "hand.tap.fill").foregroundColor(.white)
                    
                    Text("Check out").foregroundColor(.white)
                    
                }
            )
        })
    }
}

#Preview {
    checkout()
}
