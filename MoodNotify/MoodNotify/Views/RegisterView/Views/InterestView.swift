//
//  InterestView.swift
//  MoodNotify
//
//  Created by mehmet duran on 3.12.2023.
//

import SwiftUI
#warning("need configure, bad coding for now")
struct InterestView: View {
    var body: some View {
        VStack {
            HStack(spacing: .widthSize(10)) {
                InterestItemView(interestModel: InterestsModel.interestsArray[0])
                InterestItemView(interestModel: InterestsModel.interestsArray[1])
                InterestItemView(interestModel: InterestsModel.interestsArray[2])
            }.padding(.top)
            
            HStack(spacing: .widthSize(10)) {
                InterestItemView(interestModel: InterestsModel.interestsArray[3])
                InterestItemView(interestModel: InterestsModel.interestsArray[4])
            }.padding(.top, .heightSize(30))
            
            HStack(spacing: .widthSize(10)) {
                InterestItemView(interestModel: InterestsModel.interestsArray[5])
                InterestItemView(interestModel: InterestsModel.interestsArray[6])
                InterestItemView(interestModel: InterestsModel.interestsArray[7])
            }.padding(.top, .heightSize(30))
            
            HStack(spacing: .widthSize(10)) {
                InterestItemView(interestModel: InterestsModel.interestsArray[8])
                InterestItemView(interestModel: InterestsModel.interestsArray[9])
            }.padding(.top, .heightSize(30))
            
            HStack(spacing: .widthSize(10)) {
                InterestItemView(interestModel: InterestsModel.interestsArray[10])
                InterestItemView(interestModel: InterestsModel.interestsArray[11])
                InterestItemView(interestModel: InterestsModel.interestsArray[12])
            }.padding(.top, .heightSize(30))
            
            HStack(spacing: .widthSize(10)) {
                InterestItemView(interestModel: InterestsModel.interestsArray[13])
                InterestItemView(interestModel: InterestsModel.interestsArray[14])
            }.padding(.top, .heightSize(30))
        }
    }
}

#Preview {
    InterestView()
}
