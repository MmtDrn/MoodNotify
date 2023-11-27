//
//  CircleView.swift
//  MoodNotify
//
//  Created by mehmet duran on 27.11.2023.
//

import SwiftUI

struct CircleView: View {
    var body: some View {
        ZStack {
            Circle()
                .stroke(LinearGradient(colors: [.colorWomen, .colorMan], startPoint: .topLeading, endPoint: .bottomTrailing),
                        style: StrokeStyle(lineWidth: 3, lineCap: .butt, lineJoin: .miter, miterLimit: 0, dash: [.widthSize(20), .widthSize(20)], dashPhase: 0))
                .frame(width: .widthSize(400), height: .heightSize(350))
            
            Circle()
                .stroke(lineWidth: .widthSize(20))
                .frame(width: .widthSize(275), height: .heightSize(275))
                .foregroundStyle(.colorWomen)
            
            Circle()
                .stroke(lineWidth: .widthSize(20))
                .frame(width: .widthSize(200), height: .heightSize(200))
                .foregroundStyle(.colorMan)
            
            Circle()
                .frame(width: .widthSize(100), height: .heightSize(100))
                .foregroundStyle(.colorButton.opacity(0.5))
        }
        .overlay(alignment: .top) {
            Text(String("✈️".reversed()))
                .font(.largeTitle)
        } //: Plane
        .overlay(alignment: .topTrailing) {
            Text("🥰")
                .font(.largeTitle)
                .padding(.trailing, .widthSize(80))
                .padding(.top, .heightSize(50))
                .rotationEffect(.degrees(20))
        } //: HeartFace
        .overlay(alignment: .topLeading) {
            Text("💬")
                .font(.largeTitle)
                .padding(.leading, .widthSize(90))
                .padding(.top, .heightSize(50))
        } //: Message
        .overlay(alignment: .bottom) {
            Text("🏋🏼")
                .font(.largeTitle)
        } //: HalterMan
        .overlay(alignment: .bottom) {
            Text("🐈")
                .font(.largeTitle)
                .padding(.bottom, .heightSize(50))
                .padding(.leading, .widthSize(80))
        } //: Cat
        .overlay(alignment: .bottomLeading) {
            Text("🥳")
                .font(.largeTitle)
                .padding(.leading, .widthSize(80))
                .padding(.bottom, .heightSize(50))
                .rotationEffect(.degrees(-20))
        } //: PartyFace
        .overlay(alignment: .bottomTrailing) {
            Text("🚀")
                .font(.largeTitle)
                .padding(.trailing, .widthSize(80))
                .padding(.bottom, .heightSize(30))
        } //: Rocket
        .overlay(alignment: .trailing) {
            Text("📸")
                .font(.largeTitle)
                .padding(.trailing, .widthSize(110))
                .rotationEffect(.degrees(-20))
        } //: Camera
        .overlay(alignment: .trailing) {
            Text(String("🔐".reversed()))
                .font(.largeTitle)
                .padding(.trailing, .widthSize(30))
                .padding(.bottom, .heightSize(40))
        } //: KeyLock
        .overlay(alignment: .leading) {
            Text(String("🏃🏽‍♀️".reversed()))
                .font(.largeTitle)
                .padding(.leading, .widthSize(115))
                .padding(.bottom, .heightSize(50))
        } //: RunWomen
        .overlay(alignment: .leading) {
            Text("🍕")
                .font(.largeTitle)
                .padding(.leading, .widthSize(20))
        } //: Pizza
        .overlay(alignment: .center) {
            Text("☕️")
                .font(.largeTitle)
                .padding(.bottom, .heightSize(170))
        } //: Coffee
        .overlay(alignment: .center) {
            Text("😴")
                .font(.largeTitle)
                .padding(.top, .heightSize(150))
                .rotationEffect(.degrees(20))
        } //: Sleeply
        .overlay(alignment: .center) {
            Text("📚")
                .font(.largeTitle)
                .padding(.bottom, .heightSize(60))
                .padding(.leading, .widthSize(110))
        } //: Books
        
    }
}

#Preview {
    CircleView()
}
