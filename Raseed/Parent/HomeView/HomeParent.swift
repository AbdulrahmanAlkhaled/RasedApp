//
//  ChildView.swift
//  Raseed
//
//  Created by ABDULRAHMAN AL-KHALED on 31/12/2023.
//







import SwiftUI

struct HomeParent: View {
    @StateObject var vm = ChildernViewModel()
    @State var isPresented = false
    
    var body: some View {
        // NavigationStack{
        ScrollView{
            LazyVStack{
                HStack {
                   // Image(systemName: "person.circle")
                       // .resizable()
                       // .scaledToFit()
                        //.frame(width: 40, height: 40)
                      //  .foregroundColor(.gray)
                    
                    VStack(alignment: .leading) {
                        Text("Hello, ")
                            .foregroundStyle(.gray)
                        Text("Abdullah Khalaf").foregroundColor(.black)
                            .bold()
                    }
                    Spacer()
                    
                    // Image(systemName: "bell").resizable().scaledToFit().frame(width:30,height: 30)
                }
                .padding(.horizontal)
                
                
                
                
                VStack {
                    HStack{
                        Text("Child Attendance").font(.title2).frame(maxWidth:.infinity,alignment:.leading).bold()
                       // Image("loc").resizable().scaledToFit().frame(width:30,height: 30)
                        
                    }
                    
                    
                    VStack {
                        
                        
                        ForEach(vm.childerns.indices, id: \.self) { i in
                            VStack{
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color.back)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 15)
                                            .stroke(Color.strok, lineWidth: 1)
                                    )
                                    .frame(width:350, height: 380)
                                    .overlay(
                                        VStack{
                                            HStack {
                                               
                                                VStack{
                                                    Text(vm.childerns[i].name).foregroundColor(.black).font(.title3).bold()
                                                        .foregroundColor(.black).font(.subheadline)
                                                        .frame(maxWidth: .infinity, alignment: .leading)
                                                      Text(vm.childerns[i].grade).foregroundColor(.gray)//.bold()
                                                        .frame(maxWidth: .infinity, alignment: .leading)
                                                }
                                                
                                               // Spacer()
                                                
                                                Button(action: {
                                                    isPresented.toggle()
                                                }, label: {
                                                    
                                                    Image(systemName: "chevron.up.circle.fill").resizable().scaledToFit().frame(width:30,height:30).foregroundColor(.col1)
                                                    
                                                }
                                                )
                                                
                                                
                                            }
                                            
                                            
                                            Divider()
                                            
                                            Spacer()
                                            CurrentDate()
                                           
                                           
                                            
                                            
                                            MyButton(myModel: vm.childerns[i])
                                            
                                            HStack(spacing:40){
                                                
                                                VStack{
                                                    Image(systemName: "arrow.forward.to.line.square")
                                                        .resizable().scaledToFit().frame(width:20,height: 20).foregroundStyle(.col1)
                                                    Text("7:30 AM").font(.callout)
                                                    Text("check in").font(.footnote).foregroundColor(.gray)
                                                }
                                                
                                                VStack{
                                                    Image(systemName: "arrow.backward.to.line.square")
                                                        .resizable().scaledToFit().frame(width:20,height: 20).foregroundStyle(.col2)
                                                    Text("12:30 PM").font(.callout)
                                                    Text("check out").font(.footnote).foregroundColor(.gray)
                                                }
                                                
                                                VStack{
                                                    Image(systemName: "hourglass")
                                                        .resizable().scaledToFit().frame(width:20,height: 20).foregroundStyle(.black)
                                                    Text("8").font(.callout)
                                                    Text("hours").font(.footnote).foregroundColor(.gray)
                                                }
                                                
                                                
                                                
                                            }//
                                            Spacer()
                                        }
                                            .padding()
                                    )
                            }
                            
                            
                        }//
                        
                    }
                    .onAppear {
                        Task {
                            await vm.getData()
                        }
                    }
                }.padding()
                    .sheet(isPresented: $isPresented, content: {
                        ChildrenView()
                            .presentationDetents([.height(600)])
                            .presentationCornerRadius(30)
                        //Button("Back to Main") {
                        // isPresented = false
                        
                        // }
                    })
            }.padding()
        }
        
    }
}

#Preview {
    HomeParent()
}





struct MyButton: View {
    @State var myModel: Childern
    @State var OnTab = false
    @StateObject var vm = CheckInOutViewModel()
    var body: some View {
        VStack{
            Button(action: {
                Task {
                    await vm.addData()
                }
                OnTab.toggle()
            }, label: {
                Circle().scaledToFit().frame(width:100,height: 150
                ).foregroundColor(OnTab ? Color.gray : Color.col2).shadow(radius: 20).overlay(
                    VStack{
                        Image(systemName: "hand.tap.fill").foregroundColor(.white)
                        
                        Text("Check out").foregroundColor(.white)
                        
                    }
                )
            })
        }
        
    }
}
