//
//  AddListView.swift
//  Raseed
//
//  Created by ABDULRAHMAN AL-KHALED on 04/01/2024.
//

import SwiftUI

struct AddListView: View {
    @StateObject var vm = ManagerViewModel()
    @State var alertNew: Bool = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
            VStack(spacing: 8*20) {
                Text("Add teacher")
                    .font(.title)
                    .bold()
                VStack(spacing: 8*6) {
                    IDFieldview(text: $vm.titleTextField)
                    NameFieldView(text: $vm.titleTextField2)
                    
                    //MajorFieldView(text: $vm.titleTextField)
                    PhoneNumberFieldView(text: $vm.titleTextField3)
                }
                .padding(.vertical)
                
                Button {
                    Task {
                        await vm.addData()
                    }
                    dismiss()
                } label: {
                    Text("Save")
                        .foregroundStyle(.white)
                        .bold()
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 20)
                            .frame(width: 365)
                            .foregroundStyle(.myprimary)
                                    
                        )
                }
            }
            .padding()
        }
    }

#Preview {
    AddListView()
}




