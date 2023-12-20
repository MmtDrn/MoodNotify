//
//  OnboardingButtonStyle.swift
//  MoodNotify
//
//  Created by mehmet duran on 28.11.2023.
//

import SwiftUI

struct OnboardingButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: .widthSize(30), style: .continuous )
                .frame(height: .heightSize(49))
                .foregroundColor(.colorButtonSecond)
            
            configuration.label
                .fontWeight(.semibold)
                .foregroundColor(Color(.white))
        }
    }
}
