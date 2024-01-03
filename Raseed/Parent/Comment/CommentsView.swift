//
//  CommentsView.swift
//  Raseed
//
//  Created by ABDULRAHMAN AL-KHALED on 25/12/2023.
//

import SwiftUI

struct CommentsView: View {
    @State var isPresented = false
    @State var state = ""
    @State var reson = ""
    @State private var searchText = ""
    var body: some View {
        VStack{
        
            HStack{
                Image(systemName:"bell")
                Spacer()
                Image("loc")
                }
           
            VStack{
                Text("All Request").frame(maxWidth:.infinity,alignment: .leading).font(.title2).bold()
            }
            
            HStack{
                
                RoundedRectangle(cornerRadius: 20)
                    .fill(.white)
                    .shadow(color:.gray.opacity(0.4),radius:10)
                    .frame(width:350,height: 50)
                    .overlay(
                        HStack{
                            
                            TextField("search..", text: $searchText)
                               .padding(.leading)
                            
                            Image(systemName:"magnifyingglass").resizable()
                                .scaledToFit().frame(width:25)
                                .foregroundColor(.col1.opacity(0.5))
                                .padding(.trailing)
                            
                        }
                    
                    
                    
                    )
                
                
            }//
            
           
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
        Spacer()
            VStack{
                //Spacer()
                Button(action: {
                    isPresented.toggle()
                }, label: {
                    RoundedRectangle(cornerRadius: 25.0)
                        .fill(.col1).stroke(.col1)
                        .frame(width: 350,height: 50)
                        .overlay {
                            HStack{
                                Text("request leaves").frame(maxWidth:.infinity,alignment:.leading)
                                    .font(.title2)
                                    .foregroundColor(.white)
                                
                                Image(systemName: "chevron.right").foregroundColor(.white)
                            }.padding()
                        }
                        .padding(.bottom,30)
               
                })
            
        }
        .sheet(isPresented: $isPresented, content: {
            MasseageView()
        })
        }.padding()//
        
    }
}

#Preview {
    CommentsView()
}
