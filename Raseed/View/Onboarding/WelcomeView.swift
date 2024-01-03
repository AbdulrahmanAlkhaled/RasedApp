//
//  WelcomeView.swift
//  Raseed
//
//  Created by ABDULRAHMAN AL-KHALED on 23/12/2023.
//

import SwiftUI

struct WelcomeView: View {
    @State var isActive = false
    @State var size = 0.8
    @State var opacity = 0.5
    var body: some View {
        if isActive {
            OnboardingView()
        }else{
            ZStack{
                if self.isActive{
                   ParentView()
                }else{
                    ZStack{
                        Color(.col1).ignoresSafeArea()
                        VStack{
                            Image(systemName: "chevron.right.2").resizable().scaledToFit().frame(width:80,height: 80).foregroundColor(.white)
                            Text("Attendance App").font(.title).foregroundStyle(.white)
                        }
                    }
                }
            }
                .onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                                  withAnimation {
                                      self.isActive = true
                                  }
                              }
                }
            
        }
    }
}

#Preview {
    WelcomeView()
}
