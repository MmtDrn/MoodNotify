//
//  NameBirthdayView.swift
//  MoodNotify
//
//  Created by mehmet duran on 1.12.2023.
//

import SwiftUI

struct NameBirthdayView: View {
    // MARK: - Properties
    @State var name: String = ""
    @State private var date = Date()
    
    // MARK: - Body
    var body: some View {
        TextField("", text: $name, prompt: Text("Your name"))
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
        
        
        DatePicker("", selection: $date, displayedComponents: [.date])
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
    }
}

#Preview {
    NameBirthdayView()
}
