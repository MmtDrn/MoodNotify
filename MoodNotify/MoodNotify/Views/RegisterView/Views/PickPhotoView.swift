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

//#Preview {
//    PickPhotoView(image: .constant(UIImage()))
//}
