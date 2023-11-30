//
//  RegisterView.swift
//  MoodNotify
//
//  Created by mehmet duran on 30.11.2023.
//

import SwiftUI

struct RegisterView: View {
    // MARK: - Properties
    @State private var step: RegisterStep = .nameBirthday
    @State var currentStep: Int = 1
    
    // MARK: - Body
    var body: some View {
        VStack {
            Text(step.title)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundStyle(.colorButton)
                .padding(.top, .heightSize(40))
            
            Spacer()
            
            StepButtonsView(currentStep: $currentStep, step: $step)
            
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
