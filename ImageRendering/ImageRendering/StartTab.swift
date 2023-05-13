//
//  StartTab.swift
//  ImageRendering
//
//  Created by GYURI PARK on 2023/05/13.
//

import SwiftUI

struct StartTab: View {
    var body: some View {
        TabView{
            BusinessCard()
                .tabItem {
                    Label("Business Card", systemImage: "person.text.rectangle.fill")
                }
            ChartView()
                .tabItem {
                    Label("Chart", systemImage: "chart.bar.fill")
                }
        }
    }
}

struct StartTab_Previews: PreviewProvider {
    static var previews: some View {
        StartTab()
    }
}
