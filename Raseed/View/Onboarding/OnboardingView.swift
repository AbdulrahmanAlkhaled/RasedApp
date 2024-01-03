//
//  OnboardingView.swift
//  Raseed
//
//  Created by ABDULRAHMAN AL-KHALED on 23/12/2023.
//

import SwiftUI
import Lottie

struct Onboarding {
    var imageName: String
    var title: String
    var description: String
}

struct OnboardingView: View {
    let onboardingStep = [
        Onboarding(imageName: "Animation1", title: "Check-in", description: "Creating an attendance app for schools involves building a system that allows parents and teachers to manage and track student attendance safely"),
        
        Onboarding(imageName: "Animation", title: "Easy to Management", description: "The system aims to enhance communication between parents and teachers and provide a mechanism for monitoring student movements.")
    ]
    @State var animationState: Bool = false
    @State private var currentStep = 0
    @State var showingLoginScreen: Bool = false
    
    init(){
        UIScrollView.appearance().bounces = false
    }
    
    var body: some View {
        NavigationStack {
            ZStack{
                Color.background
                    .ignoresSafeArea()
                Image("circle")
                    .resizable()
                    .frame(width: 400, height: 567)
                    .offset(CGSize(width: -10.0, height: -160.0))
                VStack{
                    TabView (selection: $currentStep){
                        ForEach(0..<onboardingStep.count){ index in
                            
                            VStack(spacing: 10){
                                if  currentStep == 0{
                                    LottieView(animation: .named("Animation1")).playing().looping()
                                        .resizable()
                                        .frame(height: 380)
                                    
                                }else if currentStep == 1{
                                    LottieView(animation: .named("Animation3")).playing().looping()
                                        .resizable()
                                        .frame(height: 380)
                                }
                                VStack{
                                    VStack(spacing: 20){
                                        Text(onboardingStep[index].title)
                                            .font(.title2)
                                            .multilineTextAlignment(.center)
                                            .bold()
                                        Text(onboardingStep[index].description)
                                            .foregroundStyle(.gray)
                                            .multilineTextAlignment(.center)
                                            .frame(width: 300)
                                    }.padding()
                                    VStack{
                                        HStack{
                                            ForEach(0..<onboardingStep.count){index in
                                                if index == currentStep{
                                                    Rectangle()
                                                        .frame(width: 20, height: 10)
                                                        .cornerRadius(10)
                                                        .foregroundColor(.myprimary)
                                                        .padding(.vertical)
                                                }else{
                                                    Circle()
                                                        .frame(width: 10, height: 10)
                                                        .foregroundColor(.gray)
                                                    
                                                }}
                                        }
                                    }
                                    
                                    Button(action: {
                                        if self.currentStep < onboardingStep.count - 1{
                                            self.currentStep += 1
                                        }
                                    })
                                    {
                                        if currentStep ==  0  {
                                            Button(action: {
                                                self.currentStep = onboardingStep.count - 1
                                            }){
                                                
                                                
                                                HStack{
                                                    
                                                    Text("Next")
                                                        .bold()
                                                        .padding(.horizontal)
                                                    Image(systemName: "arrow.right")
                                                } .padding()
                                                    .frame(maxWidth: .infinity)
                                                    .background(.myprimary)
                                                    .cornerRadius(25)
                                                    .frame(width: 132)
                                                    .padding(.horizontal)
                                                    .foregroundColor(.white)
                                                    .frame(maxWidth: .infinity, alignment: .trailing)
                                                
                                            }
                                        }
                                        else {
                                            
                                            
                                            NavigationLink(destination: OptionsView()){
                                                Text("Let's get started")
                                                    .bold()
                                            }
                                            .padding()
                                            .frame(maxWidth: .infinity)
                                            .background(.myprimary)
                                            .cornerRadius(25)
                                            .frame(width: 340)
                                            .padding(.horizontal)
                                            .foregroundColor(.white)
                                            
                                        }
                                        
                                    }
                                    
                                }
                                
                            }
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                }
            }.toolbarTitleDisplayMode(.automatic)
        }
    }
}

#Preview {
    OnboardingView()
}
