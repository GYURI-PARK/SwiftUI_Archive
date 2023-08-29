//
//  MainView.swift
//  LazyVStackPractice
//
//  Created by GYURI PARK on 2023/07/30.
//

import SwiftUI

struct MainView: View {
    @State private var showMainView = false
    
    var body: some View {
        ZStack {
            if showMainView {
                Text("dfsdfs")
            } else {
                SplashView()
                    .onAppear {
//                        withAnimation {
                            // 애니메이션 블록 안에서 직접 showMainView를 변경합니다.
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                showMainView = true
                            }
//                        }
                    }
            }
        }
    }
}
