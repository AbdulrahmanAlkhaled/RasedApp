//
//  Sheet.swift
//  Raseed
//
//  Created by ABDULRAHMAN AL-KHALED on 25/12/2023.
//

import SwiftUI

struct Sheet: View {
    @State var isPresented = false
    var body: some View {
        VStack{
            //Spacer()
            Button(action: {
                isPresented.toggle()
            }, label: {
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(.col1)
                    .frame(width: 300,height: 50)
                    .overlay {
                        Text("your children")
                            .font(.title2)
                            .foregroundColor(.white)
                    }
                    .padding(.bottom,30)
           
            })
        
    }
    .sheet(isPresented: $isPresented, content: {
        HomeViewParents()
    })
    }
}

#Preview {
    Sheet()
}
