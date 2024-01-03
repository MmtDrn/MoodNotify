//
//  AuthMidView.swift
//  MoodNotify
//
//  Created by mehmet duran on 20.12.2023.
//

import SwiftUI

struct AuthMidView: View {
    var body: some View {
        VStack {
            HStack(spacing: .widthSize(30)) {
                VStack(spacing: .heightSize(15)) {
                    Image(systemName: "bubble.middle.bottom.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: .widthSize(60), height: .heightSize(60))
                        .foregroundStyle(.white)
                        .shadow(radius: 5)
                        .overlay {
                            Text("🎮")
                                .font(.title)
                                .padding(.bottom)
                        }
                    
                    Image("robbie")
                        .resizable()
                        .scaledToFill()
                        .frame(width: .widthSize(84), height: .heightSize(84))
                        .clipShape(.circle)
                        .background(
                            Circle()
                                .stroke(.colorMan, lineWidth: .widthSize(10))
                                .shadow(radius: 5)
                        )
                } //: robbie
                
                VStack(spacing: .heightSize(15)) {
                    Image("rhea")
                        .resizable()
                        .scaledToFill()
                        .frame(width: .widthSize(84), height: .heightSize(84))
                        .clipShape(.circle)
                        .background(
                            Circle()
                                .stroke(.colorWomen, lineWidth: .widthSize(10))
                                .shadow(radius: 5)
                        )
                    
                    Image(systemName: "bubble.middle.top.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: .widthSize(60), height: .heightSize(60))
                        .foregroundStyle(.white)
                        .shadow(radius: 5)
                        .overlay {
                            Text("💃")
                                .font(.title)
                                .padding(.top)
                        }
                } //: rhea
                
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
                    
                    Image("lynn")
                        .resizable()
                        .scaledToFill()
                        .frame(width: .widthSize(84), height: .heightSize(84))
                        .clipShape(.circle)
                        .background(
                            Circle()
                                .stroke(.colorWomen, lineWidth: .widthSize(10))
                                .shadow(radius: 5)
                        )
                } //: lynn
            }
        }
    }
}

#Preview {
    AuthMidView()
}
