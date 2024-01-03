//
//  EditProfileView.swift
//  Raseed
//
//  Created by ABDULRAHMAN AL-KHALED on 25/12/2023.
//

import SwiftUI

struct EditProfileView: View {
    @Environment(\.dismiss) var dismiss
    @State var isSelectedM = false
    @State var isSelectedF = false
    @State var userName = ""
    @State var userPhone = ""
    @State var userEmail = ""
    @State var birthDate = Date()
    var body: some View {
        
        NavigationView{
            
            VStack{
                
                // HStack{
                // NavigationLink {
                // ProfileParents()
                // } label: {
                //    BackButton()
                //   }.foregroundColor(.black)
                
                Text("Edit Profile")
                    .font(.title2)
                    .bold()
                Spacer()
                //  }
                
                VStack(alignment: .leading){
                    
                    NameFieldView(text: $userName)
                    
                }.frame(maxWidth: .infinity,alignment: .leading)
                    .padding()
                
                VStack(alignment: .leading){
                    Text("Date of Birth")
                        .bold()
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.back)
                        .stroke(.myprimary, lineWidth: 0.3)
                        .frame(height: 55)
                        .overlay {
                            HStack{
                                Text("\(birthDate.formatted(date: .long, time: .omitted))")
                                    .foregroundColor(.gray.opacity(0.5))
                                Spacer()
                                Image(systemName: "calendar")
                                    .foregroundStyle(.gray)
                                    .overlay{
                                        DatePicker(
                                            "",
                                            selection: $birthDate,
                                            displayedComponents: [.date]
                                            
                                        )
                                        .blendMode(.destinationOver)
                                    }
                            }.padding(.horizontal)
                            
                            
                            
                        }
                    
                    
                }.frame(maxWidth: .infinity,alignment: .leading)
                    .padding()
                
                
                VStack(alignment: .leading){
                    Text("Gender")
                        .bold()
                    HStack{
                        HStack{
                            Image(systemName: isSelectedM ? "checkmark.circle.fill" : "circle")
                                .resizable()
                                .frame(width: 30,height: 30)
                                .foregroundColor(isSelectedM ? .blue : .gray)
                                .onTapGesture(perform: {
                                    isSelectedM.toggle()
                                })
                            
                            Text("Male")
                        }
                        Spacer()
                        HStack{
                            Image(systemName: isSelectedF ? "checkmark.circle.fill" : "circle")
                                .resizable()
                                .frame(width: 30,height: 30)
                                .foregroundColor(isSelectedF ? .blue : .gray)
                                .onTapGesture(perform: {
                                    isSelectedF.toggle()
                                })
                            
                            Text("Female")
                        }
                        
                    }.padding(.top,8)
                        .padding(.trailing)
                }.frame(maxWidth: .infinity,alignment: .leading)
                    .padding()
                
                PhoneNumberFieldView(text: $userPhone)
                    .padding()
                
                EmailFieldView(text: $userEmail)
                    .padding()
                Spacer()
                Button(action: { }, label: {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(maxWidth: .infinity,maxHeight: 50)
                        .foregroundColor(.col1)
                        .padding()
                    
                        .overlay {
                            Text("Save")
                                .foregroundColor(.white)
                                .bold()
                                .font(.title3)
                        }
                })
                
                
                
            }//.navigationTitle("Notifications")
            //.navigationBarItems(trailing: Button(action: {}) {
            //  Image(systemName: "bell")
            //   .padding(4)
            //  .foregroundStyle(.black)
            //  .background(RoundedRectangle(cornerRadius: 10)
            //  .foregroundStyle(.gray.opacity(0.1))
            //  )
            //  }
            //   )
            
            
            
            
            
            
        }.navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image(systemName: "chevron.backward")
                            .foregroundStyle(.gray)
                    }
                           
                    )
                }
            }
    }
}

#Preview {
    EditProfileView()
}

//struct BackButton: View {
 //   var body: some View {
   //     Image(systemName: "arrow.left")
         //   .resizable()
           // .scaledToFit()
          //  .frame(width: 20)
           // .padding()
           // .background(.green)
          //  .clipShape(Circle())
          //  .shadow(color: .gray.opacity(0.5),radius: 5)
          //  .padding(.leading)
//    }
//}

//#Preview {
  //  BackButton()
//}
