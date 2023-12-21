//
//  InterestView.swift
//  MoodNotify
//
//  Created by mehmet duran on 3.12.2023.
//

import SwiftUI
#warning("need configure, bad coding for now")
struct InterestView: View {
    @ObservedObject var viewModel: UserAppearanceViewModel
    @State private var interestsArray: [InterestsModel] = [.init(name: "Gaming", image: "🎮", isSelected: false),
                                                   .init(name: "Dancing", image: "💃", isSelected: false),
                                                   .init(name: "Music", image: "🎶", isSelected: false),
                                                   .init(name: "Movie", image: "🎬", isSelected: false),
                                                   .init(name: "Architecture", image: "🏛️", isSelected: false),
                                                   .init(name: "Fashion", image: "👠", isSelected: false),
                                                   .init(name: "Book", image: "📚", isSelected: false),
                                                   .init(name: "Writing", image: "✍️", isSelected: false),
                                                   .init(name: "Nature", image: "🌲", isSelected: false),
                                                   .init(name: "Painting", image: "🎨", isSelected: false),
                                                   .init(name: "Football", image: "⚽️", isSelected: false),
                                                   .init(name: "Talk", image: "💬", isSelected: false),
                                                   .init(name: "Animals", image: "🐾", isSelected: false),
                                                   .init(name: "Gym&Fitness", image: "💪", isSelected: false),
                                                   .init(name: "Photography", image: "📸", isSelected: false)]
    
    var body: some View {
        VStack {
            Text("\(viewModel.interests.count)/5")
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundStyle(LinearGradient(colors: [.colorMan.opacity(2), .colorWomen.opacity(2)], startPoint: .leading, endPoint: .trailing))
                .padding(.leading, .widthSize(300))
                .shake($viewModel.interestsShake)
            
            HStack(spacing: .widthSize(10)) {
                InterestItemView(interestModel: $interestsArray[0])
                InterestItemView(interestModel: $interestsArray[1])
                InterestItemView(interestModel: $interestsArray[2])
            }.padding(.top)
            
            HStack(spacing: .widthSize(10)) {
                InterestItemView(interestModel: $interestsArray[3])
                InterestItemView(interestModel: $interestsArray[4])
            }.padding(.top, .heightSize(30))
            
            HStack(spacing: .widthSize(10)) {
                InterestItemView(interestModel: $interestsArray[5])
                InterestItemView(interestModel: $interestsArray[6])
                InterestItemView(interestModel: $interestsArray[7])
            }.padding(.top, .heightSize(30))
            
            HStack(spacing: .widthSize(10)) {
                InterestItemView(interestModel: $interestsArray[8])
                InterestItemView(interestModel: $interestsArray[9])
            }.padding(.top, .heightSize(30))
            
            HStack(spacing: .widthSize(10)) {
                InterestItemView(interestModel: $interestsArray[10])
                InterestItemView(interestModel: $interestsArray[11])
                InterestItemView(interestModel: $interestsArray[12])
            }.padding(.top, .heightSize(30))
            
            HStack(spacing: .widthSize(10)) {
                InterestItemView(interestModel: $interestsArray[13])
                InterestItemView(interestModel: $interestsArray[14])
            }.padding(.top, .heightSize(30))
        }
        .onAppear {
            viewModel.interests.forEach { selectedModel in
                for index in 0..<interestsArray.count {
                    if interestsArray[index].id == selectedModel.id {
                        interestsArray[index].isSelected.toggle()
                    }
                }
            }
        }
        .onChange(of: interestsArray) { _ in
            viewModel.interests = interestsArray.filter { $0.isSelected == true }
        }
    }
}

//#Preview {
//    InterestView(viewModel: UserAppearanceViewModel())
//}
