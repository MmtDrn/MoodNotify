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
                DigitsCodeView()
            }
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
}

#Preview {
    PhoneNumberVerifyView()
}
