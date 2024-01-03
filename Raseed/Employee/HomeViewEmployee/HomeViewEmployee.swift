//
//  HomeViewEmployee.swift
//  Raseed
//
//  Created by ABDULRAHMAN AL-KHALED on 25/12/2023.
//

import SwiftUI

struct HomeViewEmployee: View {
    @State private var formattedDate = ""
    @StateObject var vm = ChildernViewModel()
    @StateObject var vm2 = CheckInOutViewModel()
    @State var OnTab = false

    var body: some View {
            ScrollView(){
                LazyVStack{
                 
                    HStack {
                       
                        VStack(alignment: .leading) {
                            Text("Hello,")
                                .font(.subheadline)
                                .foregroundStyle(.gray)
                            Text("Rayan Meshal")
                                .bold()
                        }
                        Spacer()
                        
                    }
                    
                    VStack{
                        HStack{
                            Text("Now Attendance").font(.title2).frame(maxWidth:.infinity,alignment:.leading).bold()
                        }
                    }.padding()
                    
                    ForEach(vm.childerns, id: \.id) { info in
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.log)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.strok, lineWidth:0.5)
                            )
                            .frame(width:350, height: 200)
                            .overlay(
                                VStack(spacing:4){
                                    HStack {
                                        Image("Child")
                                            .resizable()
                                            .cornerRadius(30)
                                            .frame(width: 60, height: 60)
                                        VStack(alignment:.leading){
                                            Text(info.name).foregroundColor(.black).font(.title3).bold()
                                                .foregroundColor(.black).font(.subheadline)
                                            Text(info.grade).foregroundColor(.gray).bold()
                                            
                                        }.frame(maxWidth:.infinity,alignment:.leading)
                                        
                                        //Image(systemName: "chevron.forward")
                                     
                                    }
                                    Divider()
                                   // Spacer()
                                    
                                        HStack{
                                            Text("Date:").font(.headline).foregroundColor(.gray)
                                            VStack {
                                                Text(formattedDate)
                                                    .font(.headline)
                                            }
                                            .onAppear {
                                                updateDate()
                                                Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                                                    updateDate()
                                                }
                                            }
                                        
                                        }
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding()
                                        Button(action: {
                                            Task {
                                                await vm2.addData2()
                                            }
                                            OnTab.toggle()
                                        }, label: {
                                            RoundedRectangle(cornerRadius: 15 )
                                                .frame(width: 300, height: 50)
                                            .foregroundColor(OnTab ? Color.gray : Color.myprimary).shadow(radius: 2).overlay(
                                                    Text("Present").foregroundColor(.white)
                                                        .bold()
                                            )
                                        })
                                        
                                        
                                   

                                }.padding()
                                
                            )
                    }
                }.padding()
                
            
        }
            .onAppear {
                Task {
                    await vm.getData()
                }
            }
    }
    private func updateDate() {
        let currentDate = Date()

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy"                                            // Format for day, month, and year

        formattedDate = dateFormatter.string(from: currentDate)
    }
}
#Preview {
    HomeViewEmployee()
}
