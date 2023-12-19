//
//  LoginOnboardingView.swift
//  MoodNotify
//
//  Created by mehmet duran on 14.12.2023.
//

import SwiftUI

struct LoginOnboardingView: View {
    var body: some View {
        VStack {
            HStack(spacing: .widthSize(50)) {
                VStack(spacing: .heightSize(15)) {
                    Image(systemName: "bubble.middle.bottom.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: .widthSize(60), height: .heightSize(60))
                        .foregroundStyle(.white)
                        .shadow(radius: 5)
                        .overlay {
                            Text("🥰")
                                .font(.title)
                                .padding(.bottom)
                        }
                    
                    Image("lara")
                        .resizable()
                        .scaledToFill()
                        .frame(width: .widthSize(84), height: .heightSize(84))
                        .clipShape(.circle)
                        .background(
                            Circle()
                                .stroke(.colorWomen, lineWidth: .widthSize(10))
                                .shadow(radius: 5)
                        )
                } //: lara
                
                VStack(spacing: .heightSize(15)) {
                    Image("eric")
                        .resizable()
                        .scaledToFill()
                        .frame(width: .widthSize(84), height: .heightSize(84))
                        .clipShape(.circle)
                        .background(
                            Circle()
                                .stroke(.colorMan, lineWidth: .widthSize(10))
                                .shadow(radius: 5)
                        )
                    
                    Image(systemName: "bubble.middle.top.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: .widthSize(60), height: .heightSize(60))
                        .foregroundStyle(.white)
                        .shadow(radius: 5)
                        .overlay {
                            Text("✈️")
                                .font(.title)
                                .padding(.top)
                        }
                } //: eric
            }
        }
    }
}

#Preview {
    LoginOnboardingView()
}
