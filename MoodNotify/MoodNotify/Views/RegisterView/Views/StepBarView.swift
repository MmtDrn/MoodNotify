//
//  StepBarView.swift
//  MoodNotify
//
//  Created by mehmet duran on 30.11.2023.
//

import SwiftUI

struct StepBarView: View {
    var lineColor: Color
    var stepCount: Int
    @Binding var currentStep: Int
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .trim(from: 0.0, to: CGFloat(currentStep + 1) * (0.5/CGFloat(stepCount)))
                .stroke(lineColor, style: .init(lineWidth: 12, lineCap: .round))
                .frame(height: 1)
                .padding(.horizontal)
            
            RoundedRectangle(cornerRadius: 10)
                .stroke(lineColor.opacity(0.2), lineWidth: 10)
                .frame(height: 1)
                .padding(.horizontal)
        }
        .rotationEffect(.degrees(180))
        .animation(.easeInOut(duration: 0.3), value: currentStep)
    }
}

#Preview {
    StepBarView(lineColor: .colorButton, stepCount: 15, currentStep: .constant(13))
}
