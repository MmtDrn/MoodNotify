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
    
    var body: some View {
        HStack {
            Button(action: {
                withAnimation {
                    currentStep -= 1
                }
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
            })
            .padding()
            
            Spacer()
            
            Button(action: {
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
            })
            .padding()
        }
    }
}

#Preview {
    StepButtonsView(currentStep: .constant(2))
}
