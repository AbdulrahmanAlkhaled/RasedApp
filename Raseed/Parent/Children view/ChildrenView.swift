//
//  ChildrenView.swift
//  Raseed
//
//  Created by ABDULRAHMAN AL-KHALED on 25/12/2023.
//

import SwiftUI

struct ChildrenView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var vm = ChildernViewModel()
    var body: some View {
        
        VStack{
            VStack(spacing:3){
                
                HStack{
                    Image("Child")
                        .resizable()
                        .cornerRadius(30)
                        .frame(width: 60, height: 60)
                        .padding(8)
                    VStack{
                        ForEach(vm.childerns, id: \.id) { i in
                            Text(i.name).font(.title3).frame(maxWidth:.infinity,alignment:.leading).bold()
                            Text(i.grade)
                                .foregroundStyle(.gray)
                                .frame(maxWidth:.infinity,alignment:.leading)
                        }
                    }
                    Button(action: {
                        // self.show.toggle()
                        dismiss()
                    }, label: {
                        
                        Image(systemName: "chevron.down.circle.fill").resizable().scaledToFit().frame(width:30,height:30).foregroundColor(.col1)
                        
                    })
                    
                }
                Divider()
                
            }//.padding()
            
            
            VStack(spacing: 30){
                VStack {
                    Text("School name").frame(maxWidth:.infinity,alignment:.leading).font(.headline)
                    
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.back)
                        .overlay(
                            
                            Text("Rawad school")
                        )
                        .frame(width:350, height: 60)
                    
                }
                VStack {
                    Text("Name of tetcher").frame(maxWidth:.infinity,alignment:.leading).font(.headline)
                    
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.back)
                        .overlay(
                            
                            Text("Rayan Meshal")
                        )
                        .frame(width:350, height: 60)
                    
                }
                VStack {
                    Text("Time").frame(maxWidth:.infinity,alignment:.leading).font(.headline)
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.back)
                        .overlay(
                            HStack(spacing:80){
                                
                                
                                VStack{
                                    Image(systemName: "arrow.forward.to.line.square")
                                        .resizable().scaledToFit().frame(width:40,height: 40).foregroundStyle(.col1)
                                    Text("7:30").font(.headline)
                                    Text("Attendance").font(.headline).foregroundColor(.gray)
                                }
                                VStack{
                                    Image(systemName: "arrow.backward.to.line.square")
                                        .resizable().scaledToFit().frame(width:40,height: 40).foregroundStyle(.col2)
                                    Text("12:26").font(.headline)
                                    Text("Leave").font(.headline).foregroundColor(.gray)
                                }
                            }
                            
                            
                        )
                        .frame(width:350, height: 130)
                }
                
            }
            
            // Add some spacing between items   }
            
        }.padding().frame(width:390,height:600).background(.white).cornerRadius(40)
        
        
            .onAppear {
                Task {
                    await vm.getData()
               }
            }
    }
}

#Preview {
    ChildrenView()
}
