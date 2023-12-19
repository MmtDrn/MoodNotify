//
//  LoginButtonsView.swift
//  MoodNotify
//
//  Created by mehmet duran on 28.11.2023.
//

import SwiftUI

struct LoginButtonsView: View {
    
    var loginWithPhoneAction: () -> Void
    var loginWithAppleAction: () -> Void
    var loginWithGooleAction: () -> Void
    
    
    var body: some View {
        VStack(spacing: .heightSize(15)) {
            
            Button(action: {
                loginWithPhoneAction()
            }) {
                Image(systemName: "phone.circle")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.colorButtonSecond)
                
                Text("Phone Number")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.colorButtonSecond)
            }
            .frame(width: .widthSize(260))
            .padding(.horizontal)
            .padding(.vertical, 5)
            .background(
                RoundedRectangle(cornerRadius: 40)
                    .stroke(.colorButtonSecond, lineWidth: 3)
            )
            
            Button(action: {
                loginWithAppleAction()
            }) {
                Image(systemName: "apple.logo")
                    .font(.title)
                    .foregroundStyle(.colorButtonSecond)
                
                Text("With Apple")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.colorButtonSecond)
            }
            .frame(width: .widthSize(260))
            .padding(.horizontal)
            .padding(.vertical, 5)
            .background(
                RoundedRectangle(cornerRadius: 40)
                    .stroke(.colorButtonSecond, lineWidth: 3)
            )
            
            Button(action: {
                loginWithGooleAction()
            }) {
                Image(systemName: "g.circle")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.colorButtonSecond)
                
                Text("With Google")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.colorButtonSecond)
            }
            .frame(width: .widthSize(260))
            .padding(.horizontal)
            .padding(.vertical, 5)
            .background(
                RoundedRectangle(cornerRadius: 40)
                    .stroke(.colorButtonSecond, lineWidth: 3)
            )
        } //: VStack
        .padding(.top, .heightSize(40))
    }
}

//#Preview {
//    LoginButtonsView()
//}
