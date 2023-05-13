//
//  ContentView.swift
//  PopOver
//
//  Created by GYURI PARK on 2023/05/09.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("This is the content view.")
                NavigationLink(destination: DestinationView()) {
                    Text("Go to destination")
                }
            }
        }
    }
}

struct DestinationView: View {
    var body: some View {
        Text("This is the destination view.")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
