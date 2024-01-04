//
//  Content3View.swift
//  Raseed
//
//  Created by ABDULRAHMAN AL-KHALED on 04/01/2024.
//

import SwiftUI

struct Content3View: View {
    @State var isRegistrationPresented = false
    @StateObject var vm = ManagerViewModel()
        let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    @Binding var appUser: AppUser?

    @State var isDown = false
    var body: some View {
        NavigationStack {
            ScrollView {
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(vm.access.indices, id: \ .self) { i in
                            VStack(spacing:8*1.5) {
                                VStack{
                                    Button (
                                        action: {
                                            Task {
                                                await vm.deleteData(index: i)
                                            }
                                            
                                        }, label: {
                                            
                                            Image(systemName:"xmark")
                                                .resizable()
                                                .frame(width: 10, height: 10)
                                                .foregroundStyle(.red)
                                                .padding(7)
                                                .background(Circle()
                                                    .foregroundStyle(.red.opacity(0.1))
                                                )
                                        })
                                    .frame(maxWidth:.infinity,alignment:.trailing)
                                }
                                HStack{
                                    Text("Name:")
                                        .bold()
                                    Text("\(vm.access[i].name)")
                                        .lineLimit(1)
                                        .frame(maxWidth:.infinity,alignment:.leading)
                                }
                                Divider()
                                    .foregroundStyle(.myprimary)
                                HStack {
                                    Text("Contact:")
                                        .bold()
                                    Text("\(vm.access[i].contact)")
                                    
                                    
                                }.frame(maxWidth:.infinity,alignment:.leading)
                                
                            }.padding()
                                .background(RoundedRectangle(cornerRadius: 15)
                                    .fill(Color.myprimary.opacity(0.2))
                                )
                                .background(RoundedRectangle(cornerRadius: 15)
                                    .stroke(lineWidth: 0.5)
                                    .foregroundStyle(.myprimary)
                                )
                            
                        }
                        
                    }
                    
                    .navigationTitle("List")
                    // .toolbarTitleDisplayMode(.automatic)
                    .padding()
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            NavigationLink(destination: //ProfileView(appUser: $appUser))
                                           ProfileView(appUser: $appUser))
                            {
                                Image(systemName: "gear")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                    .foregroundStyle(.gray)
                                
                            }
                            
                        }
                        
                    }
                    
                    .toolbar {
                        Button {
                            isRegistrationPresented.toggle()
                        } label: {
                            Image(systemName:"plus")
                                .padding(4)
                                .foregroundStyle(.white)
                                .background(Circle()
                                    .fill(.myprimary)
                                )
                        }
                        .sheet(isPresented: $isRegistrationPresented) {
                            AddListView()
                        }
                    }//
                    
                    .onAppear {
                        Task {
                            await vm.fetchData()
                        }
                    }
                }
            .navigationBarBackButtonHidden(true)
            
        }
    }
}
#Preview {
    Content3View(appUser: .constant(.init(uid: "1234", email: "Moha@example.com")))
}
