//
//  PickPhotoView.swift
//  MoodNotify
//
//  Created by mehmet duran on 4.12.2023.
//

import SwiftUI

struct PickPhotoView: View {
    // MARK: - Properties
    @Binding var images: [UIImage]
    var index: Int
    
    // MARK: - Body
    var body: some View {
        if images.count > index {
            Image(uiImage: images[index])
                .resizable()
                .scaledToFill()
                .frame(width: .widthSize(index == 0 ? 220 : 110), height: .heightSize(index == 0 ? 220 : 110))
                .clipShape(.rect(cornerRadius: .widthSize(20)))
                .background(
                    Color.colorGenderBackground
                        .clipShape(.rect(cornerRadius: .widthSize(20)))
                )
                .overlay(alignment: .topTrailing) {
                    Button(action: {
                        images.remove(at: index)
                    }, label: {
                        Image(systemName: "minus")
                            .font(index == 0 ? .title : .title2)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .padding(.vertical, 2)
                            .padding(.horizontal, 4)
                            .background(
                                Color.secondary
                                    .clipShape(.capsule)
                            )
                            .padding(index == 0 ? 12 : 8)
                    })
                }
        } else {
            Color.colorGenderBackground
                .clipShape(.rect(cornerRadius: .widthSize(20)))
                .frame(width: .widthSize(index == 0 ? 220 : 110), height: .heightSize(index == 0 ? 220 : 110))
                .overlay {
                    if index == 0 {
                        Image(systemName: "person.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .opacity(images.count > 0 ? 0 : 1)
                    } else {
                        Text("📸")
                            .font(.largeTitle)
                    }
                }
        }
    }
    
}

#Preview {
    PickPhotoView(images: .constant([.eric, .lara]), index: 0)
}
