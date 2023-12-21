//
//  StepButtonsView.swift
//  MoodNotify
//
//  Created by mehmet duran on 30.11.2023.
//

import SwiftUI

struct StepButtonsView: View {
    // MARK: - Properties
    private let stepCount: Int = RegisterStep.allCases.count
    @ObservedObject var viewModel: UserAppearanceViewModel
    
    var body: some View {
        HStack {
            Button(action: {
                viewModel.stepIndex -= 1
            }, label: {
                Image(systemName: "arrow.left")
                    .foregroundStyle(.white)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                    .background(
                        Circle()
                            .foregroundStyle(.colorButtonSecond)
                    )
                    .animation(.easeIn(duration: 0.2), value: viewModel.stepIndex)
                    .opacity(viewModel.stepIndex == 0 ? 0 : 1)
            })
            .disabled(viewModel.stepIndex == 0)
            .padding()
            
            Spacer()
            
            Button(action: {
                switch RegisterStep(rawValue: viewModel.stepIndex) {
                    
                case .nameBirthday:
                    if viewModel.name != "" {
                        viewModel.stepIndex += 1
                    } else {
                        viewModel.fullNameShake = true
                    }
                case .gender:
                    if let _ = viewModel.genderType {
                        viewModel.stepIndex += 1
                    } else {
                        viewModel.genderTypeShake = true
                    }
                case .interest:
                    if viewModel.interests.count != 5 {
                        viewModel.interestsShake = true
                    } else {
                        viewModel.stepIndex += 1
                    }
                case .photos:
                    if viewModel.images.count == 0 {
                        viewModel.imagesURLShake = true
                    } else {
                        viewModel.register()
                    }
                default: break
                }
            }, label: {
                Image(systemName: viewModel.stepIndex == (stepCount - 1) ? "checkmark" : "arrow.right")
                    .foregroundStyle(.white)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                    .background(
                        Circle()
                            .foregroundStyle(.colorButtonSecond)
                    )
                    .animation(.easeIn(duration: 0.2), value: viewModel.stepIndex)
//                    .opacity(viewModel.stepIndex == (stepCount - 1) ? 0 : 1)
            })
//            .disabled(viewModel.stepIndex == (stepCount - 1))
            .padding()
        }
    }
}

#Preview {
    StepButtonsView(viewModel: UserAppearanceViewModel())
}
