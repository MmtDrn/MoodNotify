//
//  GenderView.swift
//  MoodNotify
//
//  Created by mehmet duran on 1.12.2023.
//

import SwiftUI

struct GenderView: View {
    // MARK: - Properties
    @State var genderMan: Bool = false
    @State var genderWomen: Bool = false
    
    // MARK: - Body
    var body: some View {
        HStack(spacing: .widthSize(16)) {
            ZStack {
                RoundedRectangle(cornerRadius: .widthSize(20))
                    .frame(width: .widthSize(155), height: .heightSize(144))
                    .foregroundStyle(.colorGenderBackground)
                    .background(
                        RoundedRectangle(cornerRadius: .widthSize(20))
                            .stroke(lineWidth: .widthSize(10))
                            .foregroundStyle(.colorWomen)
                            .opacity(genderWomen ? 1 : 0)
                    )
                    .overlay(alignment: .topTrailing) {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.white, .colorWomen)
                            .padding(.widthSize(5))
                            .opacity(genderWomen ? 1 : 0)
                    }
                
                Image("genderWomen")
                    .resizable()
                    .scaledToFit()
                    .frame(width: .widthSize(50), height: .heightSize(50))
                    .padding(.widthSize(5))
                    .background(
                        Circle()
                            .foregroundStyle(.colorWomen)
                    )
            }
            .onTapGesture {
                genderWomen = true
                genderMan = false
            }
            
            ZStack {
                RoundedRectangle(cornerRadius: .widthSize(20))
                    .frame(width: .widthSize(155), height: .heightSize(144))
                    .foregroundStyle(.colorGenderBackground)
                    .background(
                        RoundedRectangle(cornerRadius: .widthSize(20))
                            .stroke(lineWidth: .widthSize(10))
                            .foregroundStyle(.colorMan)
                            .opacity(genderMan ? 1 : 0)
                    )
                    .overlay(alignment: .topTrailing) {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.white, .colorMan)
                            .padding(.widthSize(5))
                            .opacity(genderMan ? 1 : 0)
                    }
                
                Image("genderMan")
                    .resizable()
                    .scaledToFit()
                    .frame(width: .widthSize(50), height: .heightSize(50))
                    .padding(.widthSize(5))
                    .background(
                        Circle()
                            .foregroundStyle(.colorMan)
                    )
            }
            .onTapGesture {
                genderWomen = false
                genderMan = true
            }
        }
        .padding(.top, .heightSize(30))
    }
}

#Preview {
    GenderView()
}
