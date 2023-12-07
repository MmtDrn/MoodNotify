//
//  PhoneNumberVerifyViewModel.swift
//  MoodNotify
//
//  Created by mehmet duran on 7.12.2023.
//

import Foundation

class PhoneNumberVerifyViewModel: ObservableObject {
    @Published var step: VerifyPhoneStep = .phoneNumber
}
