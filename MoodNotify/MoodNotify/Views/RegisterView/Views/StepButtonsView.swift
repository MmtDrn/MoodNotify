//
//  StepButtonsView.swift
//  MoodNotify
//
//  Created by mehmet duran on 30.11.2023.
//

import SwiftUI

struct StepButtonsView: View {
    // MARK: - Properties
    @Binding var currentStep: Int
    private let stepCount: Int = RegisterStep.allCases.count
    
    var body: some View {
        HStack {
            Button(action: {
                currentStep -= 1
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
                    .animation(.easeIn(duration: 0.2), value: currentStep)
                    .opacity(currentStep == 0 ? 0 : 1)
            })
            .disabled(currentStep == 0)
            .padding()
            
            Spacer()
            
            Button(action: {
                currentStep += 1
            }, label: {
                Image(systemName: "arrow.right")
                    .foregroundStyle(.white)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                    .background(
                        Circle()
                            .foregroundStyle(.colorButtonSecond)
                    )
                    .animation(.easeIn(duration: 0.2), value: currentStep)
                    .opacity(currentStep == (stepCount - 1) ? 0 : 1)
            })
            .disabled(currentStep == (stepCount - 1))
            .padding()
        }
    }
}

#Preview {
    StepButtonsView(currentStep: .constant(2))
}
