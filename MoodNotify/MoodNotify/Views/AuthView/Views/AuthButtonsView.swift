//
//  AuthButtonsView.swift
//  MoodNotify
//
//  Created by mehmet duran on 28.11.2023.
//

import SwiftUI

struct AuthButtonsView: View {
    
    var loginWithAppleAction: () -> Void
    var loginWithGooleAction: () -> Void
    
    
    var body: some View {
        VStack(spacing: .heightSize(15)) {
            
            Button(action: {
                loginWithAppleAction()
            }) {
                Image(systemName: "apple.logo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: .widthSize(20), height: .heightSize(20))
                    .foregroundStyle(.white)
                
                Text("With Apple")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
            }
            .frame(width: .widthSize(260), height: .heightSize(40))
            .padding(.horizontal)
            .padding(.vertical, 5)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(.black)
            )
            
            Button(action: {
                loginWithGooleAction()
            }) {
                Image("google")
                    .resizable()
                    .scaledToFill()
                    .frame(width: .widthSize(40), height: .heightSize(40))
                
                Text("With Google")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.gray)
            }
            .frame(width: .widthSize(260), height: .heightSize(40))
            .padding(.horizontal)
            .padding(.vertical, 5)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(.white)
                    .shadow(radius: 2)
            )
        } //: VStack
        .padding(.top, .heightSize(40))
    }
}

#Preview {
    AuthButtonsView(loginWithAppleAction: {}, loginWithGooleAction: {})
}
