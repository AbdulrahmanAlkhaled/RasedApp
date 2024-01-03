//
//  HomeViewParent.swift
//  Raseed
//
//  Created by Sara on 19/06/1445 AH.
//


        //
        //  HomeViewParents.swift
        //  Raseed
        //
        //  Created by ABDULRAHMAN AL-KHALED on 25/12/2023.
        //

        import SwiftUI

        struct HomeViewParents: View {
            @ObservedObject var viewModel = AttendanceViewModel()
            @State var show = false
            @State private var formattedDate = ""
            @State var isPresented = false
            var body: some View {
                
                NavigationStack{
                    // ZStack{
                    // Color(.log).ignoresSafeArea()
                    ScrollView(showsIndicators:false ){
                        VStack{
                            HStack {
                                Image(systemName: "person.circle")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(.gray)
                                
                                VStack(alignment: .leading) {
                                    Text("Hello,")
                                        .font(.subheadline)
                                        .foregroundStyle(.gray)
                                    Text("Abdullah").foregroundColor(.gray)
                                        .opacity(0.8)
                                }
                                Spacer()
                                
                               // Image(systemName: "bell").resizable().scaledToFit().frame(width:30,height: 30)
                            }
                            .padding(.horizontal)
                            
                            
                            
                            
                            VStack {
                                HStack{
                                    Text(" Child Attendance").font(.title2).frame(maxWidth:.infinity,alignment:.leading).bold()
                                    Image("loc").resizable().scaledToFit().frame(width:30,height: 30)
                                    
                                }
                                
                                ForEach(viewModel.atten) { info in
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
                                                        Image(systemName: "person.circle")
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fit).foregroundColor(.gray)
                                                            .frame(width: 40, height: 40)
                                                        
                                                        VStack(alignment:.leading){
                                                            Text(info.name).foregroundColor(.black).font(.title3).bold()
                                                                .foregroundColor(.black).font(.subheadline)
                                                            Text(info.clas).foregroundColor(.gray).bold()
                                                            
                                                        }
                                                        Spacer()
                                                        
                                                        Button(action: {
                                                            isPresented.toggle()
                                                        }, label: {
                                                            
                                                            Image(systemName: "chevron.down.circle.fill").resizable().scaledToFit().frame(width:30,height:30).foregroundColor(.col1)
                                                            
                                                        }
                                                        )
                                                        
                                                        
                                                    }.padding()
                                                    
                                                    
                                                    Divider()
                                                    
                                                    Spacer()
                                                    
                                                    //  Text("Monday - Octoper 12,23").font(.callout)
                                                    VStack {
                                                        // Display the formatted date using a Text view
                                                        
                                                        Text(formattedDate)
                                                            .font(.headline)
                                                            .padding()
                                                    }
                                                    .onAppear {
                                                        // Call the function to update the date when the view appears
                                                        updateDate()
                                                        
                                                        // Set up a timer to update the date periodically (every 1 second in this example)
                                                        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                                                            updateDate()
                                                        }
                                                    }
                                                    
                                                    
                                                   // MyButton//(myModel: info)
                                               
                                                    HStack(spacing:40){
                                                        
                                                        VStack{
                                                            Image(systemName: "arrow.forward.to.line.square")
                                                                .resizable().scaledToFit().frame(width:20,height: 20).foregroundStyle(.col1)
                                                            Text("12:30").font(.callout)
                                                            Text("check out").font(.footnote).foregroundColor(.gray)
                                                        }
                                                        VStack{
                                                            Image(systemName: "arrow.backward.to.line.square")
                                                                .resizable().scaledToFit().frame(width:20,height: 20).foregroundStyle(.col2)
                                                            Text("12:30").font(.callout)
                                                            Text("check out").font(.footnote).foregroundColor(.gray)
                                                        }
                                                        VStack{
                                                            Image(systemName: "hourglass")
                                                                .resizable().scaledToFit().frame(width:20,height: 20).foregroundStyle(.black)
                                                            Text("12:30").font(.callout)
                                                            Text("check out").font(.footnote).foregroundColor(.gray)
                                                        }
                                                        
                                                        
                                                        
                                                    }//
                                                    Spacer()
                                                }
                                                
                                            )
                                    }
                                    
                                    
                                }
                                
                                
                                
                                
                                
                            }.padding()
                        }  .sheet(isPresented: $isPresented, content: {
                            ChildrenView()
                                .presentationDetents([.height(600)])
                                .presentationCornerRadius(30)
                            //Button("Back to Main") {
                            // isPresented = false
                            
                            // }
                        })
                        
                        
                        
                    }//.navigationTitle("Notifications")
        //                .navigationBarItems(trailing: Button(action: {}) {
        //                    Image(systemName: "bell")
        //                        .padding(4)
        //                        .foregroundStyle(.black)
        //                                            .background(RoundedRectangle(cornerRadius: 10)
        //                                                .foregroundStyle(.gray.opacity(0.1))
        //                                            )
        //                }
        //                )
                    
                    
                    // if self.show{
                    // GeometryReader{_ in
                    // VStack{
                    
                    //  feedback()
                    
                    //  }
                    //     }
                    //   }
                    
                    // }
                }
            }
            private func updateDate() {
                let currentDate = Date()

                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "dd MMMM yyyy | HH:mm"                                            // Format for day, month, and year

                formattedDate = dateFormatter.string(from: currentDate)
            }

        }


        struct MyButton2: View {
           // @State var myModel: Childern
            @State var OnTab = false
            @StateObject var vm = CheckInOutViewModel()
            var body: some View {
                VStack{
                    Button(action: {
                        Task {
                            // TODO: await vm.checkOut()
                        }
                        OnTab.toggle()
                    }, label: {
                        Circle().scaledToFit().frame(width:100,height: 150
                        ).foregroundColor(OnTab ? Color.col1 : Color.col2).shadow(radius: 20).overlay(
                            VStack{
                                Image(systemName: "hand.tap.fill").foregroundColor(.white)
                                
                                Text("Check").foregroundColor(.white)
                                
                            }
                        )
                    })
                }
                
            }
        }

        #Preview {
            HomeViewParents()
        }

   
