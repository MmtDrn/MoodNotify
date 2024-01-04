//
//  AuthButtonsView.swift
//  MoodNotify
//
//  Created by mehmet duran on 28.11.2023.
//

import SwiftUI
import _AuthenticationServices_SwiftUI

struct AuthButtonsView: View {
    @Environment(\.colorScheme) var theme
    
    var loginWithGooleAction: () -> Void
    var handleAppleRequest: (ASAuthorizationAppleIDRequest) -> Void
    var handleAppleCompletion: (Result<ASAuthorization, Error>) -> Void
    
    var body: some View {
        VStack(spacing: .heightSize(15)) {
            
            SignInWithAppleButton(.continue) { request in
                handleAppleRequest(request)
            } onCompletion: { result in
                handleAppleCompletion(result)
            }
            .frame(maxWidth: .infinity)
            .frame(height: .heightSize(60))
            .padding(.horizontal, .widthSize(50))
            .signInWithAppleButtonStyle(theme == .dark ? .white : .black)
            
            Button(action: {
                loginWithGooleAction()
            }) {
                Image("google")
                    .resizable()
                    .scaledToFill()
                    .frame(width: .widthSize(40), height: .heightSize(40))
                
                Text("Contuniue with Google")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.gray)
            }
            .frame(maxWidth: .infinity)
            .frame(height: .heightSize(58))
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(.white)
                    .shadow(radius: 2)
                    .padding(.horizontal, .widthSize(50))
            )
            
        } //: VStack
        .padding(.top, .heightSize(40))
    }
}

#Preview {
    AuthButtonsView(loginWithGooleAction: {}) { request in
        
    } handleAppleCompletion: { result in
        
    }

}
