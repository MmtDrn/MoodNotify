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
        NavigationStack {
            switch viewModel.step {
            case .phoneNumber:
                EnterPhoneNumberView(step: $viewModel.step)
            case .code:
                DigitsCodeView()
            }
        } //: NavigationStack
        .onTapGesture {
            hideKeyboard()
        }
    }
}

#Preview {
    PhoneNumberVerifyView()
}
