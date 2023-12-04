//
//  PhotosPickerView.swift
//  MoodNotify
//
//  Created by mehmet duran on 4.12.2023.
//

import SwiftUI
import PhotosUI

struct PhotosPickerView: View {
    // MARK: - Properties
    @State private var selectedItems: [PhotosPickerItem] = []
    @State private var images: [UIImage] = []
    
    // MARK: - Body
    var body: some View {
        VStack {
            HStack {
                PickPhotoView(images: $images, index: 0)
                
                VStack {
                    PickPhotoView(images: $images, index: 1)
                    
                    PickPhotoView(images: $images, index: 2)
                }
            }
            
            HStack {
                PickPhotoView(images: $images, index: 3)
                
                PickPhotoView(images: $images, index: 4)
                
                PickPhotoView(images: $images, index: 5)
            }
            
            PhotosPicker(selection: $selectedItems, maxSelectionCount: 6, matching: .images) {
                
                Text("Set Photos")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .padding(.horizontal, 20)
                    .padding(10)
                    .background(
                        Color("ColorButton")
                            .clipShape(.capsule)
                    )
                    .padding(.top, .heightSize(20))
            }
        }
        .onChange(of: selectedItems) { newValue in
            Task {
                selectedItems = []
                images = []
                
                for item in newValue {
                    if let data = try? await item.loadTransferable(type: Data.self),
                       let image = UIImage(data: data) {
                        images.append(image)
                    }
                }
            }
        }
    }
}

#Preview {
    PhotosPickerView()
}
