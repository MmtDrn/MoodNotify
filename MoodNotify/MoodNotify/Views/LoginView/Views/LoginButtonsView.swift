//
//  LoginButtonsView.swift
//  MoodNotify
//
//  Created by mehmet duran on 28.11.2023.
//

import SwiftUI

struct LoginButtonsView: View {
    var body: some View {
        VStack(spacing: .heightSize(10)) {
            HStack(spacing: 20) {
                Image(systemName: "phone.circle")
                    .font(.title)
                    .foregroundStyle(.white)
                
                Text("Phone Number")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
            }
            .frame(width: .widthSize(260))
            .padding(.vertical, 5)
            .background(.colorButton)
            .clipShape(.capsule)
            
            HStack(spacing: 10) {
                Button(action: {}, label: {
                    Image(systemName: "apple.logo")
                        .font(.title3)
                        .foregroundStyle(.white)
                    
                    Text("Apple")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                })
                .padding(.horizontal)
                .padding(.vertical, 5)
                .background(Color.colorButton)
                .clipShape(.capsule)
                
                Button(action: {}, label: {
                    Image(systemName: "g.circle")
                        .font(.title3)
                        .foregroundStyle(.white)
                    
                    Text("Google")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                })
                .padding(.horizontal)
                .padding(.vertical, 5)
                .background(Color.colorButton)
                .clipShape(.capsule)
            } //: SocialLogins
        } //: VStack
        .padding(.top, .heightSize(40))
    }
}

#Preview {
    LoginButtonsView()
}
