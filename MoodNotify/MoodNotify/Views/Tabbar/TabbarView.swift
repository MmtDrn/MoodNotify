//
//  TabbarView.swift
//  MoodNotify
//
//  Created by mehmet duran on 10.01.2024.
//

import SwiftUI

struct TabbarView: View {
    @State private var activeTab: TabModel = .home
    @Namespace private var animation
    @State private var tabShapePosition: CGPoint = .zero
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $activeTab) {
                Text("Home")
                    .tag(TabModel.home)
                
                Text("Messages")
                    .tag(TabModel.messages)
                
                Text("Profile")
                    .tag(TabModel.profile)
            }
        }
        
        CustomTabBar()
    }
    
    @ViewBuilder
    func CustomTabBar(_ tint: Color = .colorButtonSecond,
                      _ inactive: Color = .colorButton) -> some View {
        HStack(alignment: .bottom, spacing: 0) {
            ForEach(TabModel.allCases, id: \.rawValue) { tab in
                TabItemView(tint: tint,
                        inactiveTint: inactive,
                        tab: tab,
                        animation: animation,
                        activeTab: $activeTab,
                        position: $tabShapePosition)
            }
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 10)
        .background(content: {
            TabShape(midPoint: tabShapePosition.x)
                .fill(.white)
                .ignoresSafeArea()
                .shadow(color: tint.opacity(0.2), radius: 5, x: 0, y: -5)
                .blur(radius: 2)
                .padding(.top, 25)
        })
        .animation(.interactiveSpring(response: 0.6,
                                      dampingFraction: 0.7,
                                      blendDuration: 0.7), value: activeTab)
    }
}

#Preview {
    TabbarView()
}
