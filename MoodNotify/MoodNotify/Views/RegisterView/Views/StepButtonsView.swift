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
    @Binding var step: RegisterStep
    private let stepCount: Int = RegisterStep.allCases.count
    
    var body: some View {
        HStack {
            Button(action: {
                withAnimation {
                    currentStep -= 1
                    
                }
                step = .init(rawValue: currentStep-1)!
            }, label: {
                Image(systemName: "arrow.left")
                    .foregroundStyle(.white)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                    .background(
                        Circle()
                            .foregroundStyle(.colorButton)
                    )
                    .opacity(currentStep == 1 ? 0 : 1)
            })
            .disabled(currentStep == 1)
            .padding()
            
            Spacer()
            
            Button(action: {
                step = .init(rawValue: currentStep)!
                withAnimation {
                    currentStep += 1
                }
            }, label: {
                Image(systemName: "arrow.right")
                    .foregroundStyle(.white)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                    .background(
                        Circle()
                            .foregroundStyle(.colorButton)
                    )
                    .opacity(currentStep == stepCount ? 0 : 1)
            })
            .disabled(currentStep == stepCount)
            .padding()
        }
    }
}

#Preview {
    StepButtonsView(currentStep: .constant(2), step: .constant(.nameBirthday))
}
