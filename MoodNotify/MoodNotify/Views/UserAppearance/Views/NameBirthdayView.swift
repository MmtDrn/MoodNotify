//
//  NameBirthdayView.swift
//  MoodNotify
//
//  Created by mehmet duran on 1.12.2023.
//

import SwiftUI

struct NameBirthdayView: View {
    // MARK: - Properties
    @ObservedObject var viewModel: UserAppearanceViewModel
    
    // MARK: - Body
    var body: some View {
        TextField("", text: $viewModel.name, prompt: Text("Your name"))
            .foregroundStyle(.colorButtonSecond)
            .fontWeight(.semibold)
            .padding(10)
            .frame(height: .heightSize(50))
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.colorButtonSecond, lineWidth: 2)
            )
            .background(.white, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
            .padding()
            .shake($viewModel.fullNameShake)
        
        
        DatePicker("", selection: $viewModel.date, displayedComponents: [.date])
            .foregroundStyle(.colorButtonSecond)
            .fontWeight(.semibold)
            .padding(10)
            .datePickerStyle(.wheel)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.colorButtonSecond, lineWidth: 2)
            )
            .background(.white, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
            .padding(.horizontal)
            .shake($viewModel.birthdayShake)
    }
}

//#Preview {
//    NameBirthdayView(name: .constant(""), date: .constant(Date()))
//}
