//
//  Notifcationparents.swift
//  Raseed
//
//  Created by ABDULRAHMAN AL-KHALED on 25/12/2023.
//

import SwiftUI

struct Notifcationparents: View {
    @ObservedObject var viewModel = NotifcationViewModel()
    @StateObject var vm = CheckInOutViewModel()
    @State var isPresented = false
    @State var isPresented2 = false
    var body: some View {
        VStack {
            
            Text("Notifications")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            ScrollView{
                LazyVStack{
                    
                    VStack{
                        ForEach(viewModel.natifcation) { info in
                            
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.log)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(Color.strok, lineWidth:1)
                                )
                            
                                .frame(width:350, height: 180)
                                .overlay(
                                    VStack{
                                        HStack{
                                            
                                            
                                            VStack(spacing:1){
                                                HStack{
                                                    Text(info.name).foregroundColor(.black).font(.title3).bold()
                                                        .foregroundColor(.black).font(.subheadline)
                                                    Button {
                                                        
                                                    } label: {
                                                        
                                                        Image(systemName:"xmark")
                                                            .resizable()
                                                            .frame(width: 10, height: 10)
                                                            .foregroundStyle(.red)
                                                            .padding(7)
                                                            .background(Circle()
                                                                .foregroundStyle(.red.opacity(0.1))
                                                            )
                                                    }
                                                    .frame(maxWidth: .infinity, alignment: .trailing)
                                                }
                                                Text(info.clas).foregroundColor(.gray).bold()
                                                    .frame(maxWidth: .infinity, alignment: .leading)
                                            }
                                            Spacer()
                                            
                                            
                                            
                                        }
                                        Divider()
                                        
                                        
                                        HStack(spacing: 20){
                                            CurrentDate()
                                            Divider()
                                                .frame(height: 60)
                                            VStack{
                                                Image(systemName: "arrow.forward.to.line.square")
                                                    .resizable().scaledToFit().frame(width:20,height: 20).foregroundStyle(.myprimary)
                                                Text("7:28 AM").font(.callout)
                                                Text("Check in").font(.footnote).foregroundColor(.gray).bold()
                                            }
                                            
                                        }//.padding(3)
                                        
                                    }
                                        .padding()
                                )
                            
                        }
                    }
                    
                }
                    
                //.navigationBarItems(trailing: Button(action: {}) {
                //  Image(systemName: "bell")
                //   .padding(4)
                //  .foregroundStyle(.black)
                //   .background(RoundedRectangle(cornerRadius: 10)
                //     .foregroundStyle(.gray.opacity(0.1))
                // )
                //   }
                //   )
            }
            
            
            
        }.padding()
        
        
    }
    
}
#Preview {
    Notifcationparents()
}
