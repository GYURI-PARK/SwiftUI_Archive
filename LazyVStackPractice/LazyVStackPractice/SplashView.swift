//
//  SplashView.swift
//  LazyVStackPractice
//
//  Created by GYURI PARK on 2023/07/30.
//

import SwiftUI

import SwiftUI

struct SplashView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        
        if isActive {
            ContentView()
        } else {
            VStack {
                VStack {
                    Image(systemName: "hare.fill")
                        .font(.system(size: 80))
                        .foregroundColor(.red)
                    
                    Text("EPIC APP @")
                        .font(.system(size: 26))
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.2)) {
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    self.isActive = true
                }
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            
            Text("ContentView")
                .foregroundColor(.white)
                .font(.system(size: 38))
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
