//
//  RegisterView.swift
//  MoodNotify
//
//  Created by mehmet duran on 30.11.2023.
//

import SwiftUI

struct RegisterView: View {
    @ObservedObject private var viewModel = RegisterViewModel()
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 0) {
            Text("MoodNotify")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(LinearGradient(colors: [.colorWomen.opacity(2), .colorMan.opacity(2)], startPoint: .leading, endPoint: .trailing))
                .padding(.bottom, 50)
                .shadow(color: .colorWomen, radius: 2)
                .padding(.bottom, .heightSize(50))
            
            RegisterMidView()
                .padding(.bottom, .heightSize(50))
            
            Text("Choose Your Signin Method and Be Notified")
                .padding(.horizontal)
                .font(.title3)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .foregroundStyle(LinearGradient(colors: [.colorMan.opacity(2), .colorWomen.opacity(2)], startPoint: .leading, endPoint: .trailing))
                .padding(.bottom, .heightSize(50))
            
            AuthButtonsView  {
                viewModel.navigateLogic(.withApple)
            } loginWithGooleAction: {
                viewModel.navigateLogic(.withGoogle)
            }
        } //: VStack
        .navigationBarBackButtonHidden()
        .navigationDestination(isPresented: $viewModel.isPresented) {
            switch viewModel.navigateCase {
            case .withApple:
                UserAppearanceView()
                    .toolbarRole(.editor)
            case .withGoogle:
                UserAppearanceView()
                    .toolbarRole(.editor)
            case .none:
                EmptyView()
            }
        }
    }
}

#Preview {
    NavigationStack {
        RegisterView()
    }
}
