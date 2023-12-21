//
//  UserAppearanceView.swift
//  MoodNotify
//
//  Created by mehmet duran on 20.12.2023.
//

import SwiftUI

struct UserAppearanceView: View {
    @ObservedObject private var viewModel = UserAppearanceViewModel()
    var body: some View {
        VStack {
            Text(viewModel.currentStep.title)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundStyle(LinearGradient(colors: [.colorMan.opacity(2), .colorWomen.opacity(2)], startPoint: .leading, endPoint: .trailing))
                .padding(.top, .heightSize(40))
            
            switch viewModel.currentStep {
            case .nameBirthday:
                NameBirthdayView(viewModel: viewModel)
            case .gender:
                GenderView(viewModel: viewModel)
            case .interest:
                InterestView(viewModel: viewModel)
            case .photos:
               PhotosPickerView(viewModel: viewModel)
            }
            
            Spacer()
            
            StepButtonsView(viewModel: viewModel)
            
            StepBarView(lineColor: .colorButtonSecond, stepCount: RegisterStep.allCases.count, currentStep: $viewModel.stepIndex)
                .padding(.bottom, 30)
                .padding(.horizontal)
            
            
        } //: VStack
        .onTapGesture {
            hideKeyboard()
        }
    }
}

#Preview {
    UserAppearanceView()
}
