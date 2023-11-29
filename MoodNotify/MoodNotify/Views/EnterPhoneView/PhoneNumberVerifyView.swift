//
//  PhoneNumberVerifyView.swift
//  MoodNotify
//
//  Created by mehmet duran on 28.11.2023.
//

import SwiftUI

struct PhoneNumberVerifyView: View {
    @State var step: VerifyPhoneStep = .phoneNumber
    
    var body: some View {
        NavigationStack {
            switch step {
            case .phoneNumber:
                EnterPhoneNumberView(step: $step)
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
