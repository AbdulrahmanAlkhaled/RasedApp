//
//  ProfileList.swift
//  Raseed
//
//  Created by ABDULRAHMAN AL-KHALED on 25/12/2023.
//

import SwiftUI

struct ProfileList: View {
    
        var img :String
        var title:String
        var body: some View {
            RoundedRectangle(cornerRadius: 20)
                .fill(.back).stroke(.col1)
                .frame(width: 350,height: 55)
                .overlay {
                    HStack{
                       Image(systemName: img)
                    Text(LocalizedStringKey(title))
                        Spacer()
                    }.padding(.leading)
                }
        }
    }

    #Preview {
        ProfileList(img: "person", title: "Edit Profile")
    }

    

