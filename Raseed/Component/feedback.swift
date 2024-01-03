//
//  feedback.swift
//  Raseed
//
//  Created by ABDULRAHMAN AL-KHALED on 25/12/2023.
//

import SwiftUI

struct feedback: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .fill(Color.strok)
            .overlay(
                VStack(spacing:20){
                    Text("Check in ").font(.headline)
                    Image(systemName: "arrow.forward.to.line.square").resizable().scaledToFit().frame(width:40,height: 40).foregroundColor(.col1)
                    
                    Text("Are you sure want check in ? ")
                    HStack{
                        
                        Button(action: {
                            
                        }, label: {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.gray)
                                .frame(width:150,height: 40)
                                .overlay {
                                    Text("No")
                                        .font(.callout)
                                        .foregroundColor(.white)
                                }
                                .padding(.bottom,30)
                            
                        })
                        Button(action: {
                            
                        }, label: {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.col1)
                                .frame(width:150,height: 40)
                                .overlay {
                                    Text("Yes")
                                        .font(.callout)
                                        .foregroundColor(.white)
                                }
                                .padding(.bottom,30)
                            
                        })
                        
                        
                        
                    }//
                    
                    
                }.padding(.top)
            )
            .frame(width:350, height:230)
           
    }
}

#Preview {
    feedback()
}
