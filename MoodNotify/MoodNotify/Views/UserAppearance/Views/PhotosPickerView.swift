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
    @ObservedObject var viewModel: UserAppearanceViewModel
    
    // MARK: - Body
    var body: some View {
        VStack {
            HStack {
                PickPhotoView(images: $viewModel.images, index: 0)
                
                VStack {
                    PickPhotoView(images: $viewModel.images, index: 1)
                    
                    PickPhotoView(images: $viewModel.images, index: 2)
                }
            }
            
            HStack {
                PickPhotoView(images: $viewModel.images, index: 3)
                
                PickPhotoView(images: $viewModel.images, index: 4)
                
                PickPhotoView(images: $viewModel.images, index: 5)
            }
            
            PhotosPicker(selection: $selectedItems, maxSelectionCount: 6, matching: .images) {
                
                Text("Set Photos")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .padding(.horizontal, 20)
                    .padding(10)
                    .background(
                        Color.colorButtonSecond
                            .clipShape(.capsule)
                    )
                    .padding(.top, .heightSize(20))
            }
            .shake($viewModel.imagesURLShake)
        }
        .onChange(of: selectedItems) { newValue in
            Task {
                selectedItems = []
                viewModel.images = []
                
                for item in newValue {
                    if let data = try? await item.loadTransferable(type: Data.self),
                       let image = UIImage(data: data) {
                        viewModel.images.append(image)
                    }
                }
            }
        }
    }
}

#Preview {
    PhotosPickerView(viewModel: UserAppearanceViewModel())
}
