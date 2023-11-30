//
//  LoginButtonsView.swift
//  MoodNotify
//
//  Created by mehmet duran on 28.11.2023.
//

import SwiftUI

struct LoginButtonsView: View {
    var body: some View {
        VStack(spacing: .heightSize(40)) {
            VStack {
                Button {
                    
                } label: {
                    NavigationLink(destination: PhoneNumberVerifyView()) {
                        HStack {
                            Image(systemName: "phone.circle")
                                .font(.title)
                                .foregroundStyle(.white)
                            
                            Text("Login with Phone")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundStyle(.white)
                        }
                        .frame(width: .widthSize(200))
                        .padding(.vertical, 5)
                        .padding(.horizontal)
                        .background(.colorButton)
                        .clipShape(.capsule)
                    }
                } //: PhoneButton
            
                Button {
                    
                } label: {
                    HStack(spacing: 15) {
                        Image(systemName: "apple.logo")
                            .font(.title)
                            .foregroundStyle(.white)
                        
                        Text("Login with Apple")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                    }
                    .frame(width: .widthSize(200))
                    .padding(.vertical, 5)
                    .padding(.horizontal)
                    .background(.colorButton)
                    .clipShape(.capsule)
                } //: AppleButton
                
                Button {
                    
                } label: {
                    HStack {
                        Image(systemName: "g.circle")
                            .font(.title)
                            .foregroundStyle(.white)
                        
                        Text("Login with Google")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                    }
                    .frame(width: .widthSize(200))
                    .padding(.vertical, 5)
                    .padding(.horizontal)
                    .background(.colorButton)
                    .clipShape(.capsule)
                } //: GoogleButton
            } //: Buttons
            
            Button(action: {}, label: {
                NavigationLink {
                    RegisterView()
                } label: {
                    Text("Don't have an account?")
                        .font(.footnote)
                        .fontWeight(.regular)
                        .foregroundStyle(.gray)
                    
                    Text("Sign Up")
                        .font(.footnote)
                        .fontWeight(.bold)
                        .foregroundStyle(.blue)
                }

            }) //: SignupButton
        }
    }
}

#Preview {
    LoginButtonsView()
}
