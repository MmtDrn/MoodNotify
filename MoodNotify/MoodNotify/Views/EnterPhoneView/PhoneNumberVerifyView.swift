//
//  PhoneNumberVerifyView.swift
//  MoodNotify
//
//  Created by mehmet duran on 28.11.2023.
//

import SwiftUI

struct PhoneNumberVerifyView: View {
    @ObservedObject private var viewModel = PhoneNumberVerifyViewModel()
    
    var body: some View {
        ZStack {
            switch viewModel.step {
            case .phoneNumber:
                EnterPhoneNumberView(step: $viewModel.step)
            case .code:
                DigitsCodeView {
                    viewModel.isPresented = true
                }
            }
        }
        .onTapGesture {
            hideKeyboard()
        }
        .navigationDestination(isPresented: $viewModel.isPresented) {
            UserAppearanceView()
                .toolbarRole(.editor)
        }
    }
}

#Preview {
    PhoneNumberVerifyView()
}
