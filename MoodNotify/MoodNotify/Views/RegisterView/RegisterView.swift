//
//  RegisterView.swift
//  MoodNotify
//
//  Created by mehmet duran on 30.11.2023.
//

import SwiftUI

struct RegisterView: View {
    // MARK: - Properties
    private var step: RegisterStep = .nameBirthday
    @State var currentStep: Int = 0
    
    // MARK: - Body
    var body: some View {
        VStack {
            Spacer()
            
            StepButtonsView(currentStep: $currentStep)
            
            StepBarView(lineColor: .colorButton, stepCount: RegisterStep.allCases.count, currentStep: $currentStep)
                .padding(.bottom, 30)
                .padding(.horizontal)
            
            
        } //: VStack
        .background(LinearGradient(colors: [.colorWomen.opacity(0.8), .colorMan.opacity(0.8)], startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea())
    }
}

#Preview {
    RegisterView()
}
