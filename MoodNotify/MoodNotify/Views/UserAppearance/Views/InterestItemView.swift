//
//  InterestItemView.swift
//  MoodNotify
//
//  Created by mehmet duran on 1.12.2023.
//

import SwiftUI

struct InterestItemView: View {
    @Binding var interestModel: InterestsModel
    
    var body: some View {
        HStack {
            Text(interestModel.image)
            Text(interestModel.name)
        }
        .padding(.horizontal)
        .background(
            Rectangle()
                .clipShape(.capsule)
                .frame(height: .heightSize(40))
                .foregroundStyle(.colorGenderBackground)
                .overlay {
                    RoundedRectangle(cornerRadius: .widthSize(20))
                        .stroke(.colorButtonSecond, lineWidth: 5)
                        .clipShape(.capsule)
                        .opacity(interestModel.isSelected ? 1 : 0)
                }
        )
        .onTapGesture {
            interestModel.isSelected.toggle()
        }
    }
}

#Preview {
    InterestItemView(interestModel: .constant(.init(name: "Gaming", image: "🎮", isSelected: false)))
}
