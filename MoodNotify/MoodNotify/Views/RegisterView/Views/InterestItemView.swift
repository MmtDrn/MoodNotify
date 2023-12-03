//
//  InterestItemView.swift
//  MoodNotify
//
//  Created by mehmet duran on 1.12.2023.
//

import SwiftUI

struct InterestItemView: View {
    var interestModel: InterestsModel
    
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
        )
    }
}
