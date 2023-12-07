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
        VStack {
            Text(viewModel.currentStep.title)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundStyle(.colorButton)
                .padding(.top, .heightSize(40))
            
            switch viewModel.currentStep {
            case .nameBirthday:
                NameBirthdayView()
            case .gender:
                GenderView()
            case .interest:
                InterestView()
            case .photos:
               PhotosPickerView()
            }
            
            Spacer()
            
            StepButtonsView(currentStep: $viewModel.stepIndex)
            
            StepBarView(lineColor: .colorButton, stepCount: RegisterStep.allCases.count, currentStep: $viewModel.stepIndex)
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
