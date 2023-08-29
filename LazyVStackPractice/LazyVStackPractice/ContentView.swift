//
//  ContentView.swift
//  LazyVStackPractice
//
//  Created by GYURI PARK on 2023/07/30.
//

//import SwiftUI
//
//struct ContentView: View {
//    var body: some View {
//        List {
//            LazyVStack(alignment: .leading) {
//                ForEach(1..<1000, id: \.self) { row in
//                    HStack {
//                        Image(systemName: "person.fill")
//                            .foregroundColor(.blue)
//                        
//                        Text("\(row): Name, Surname")
//                            .onAppear {
//                                print("\(row) loaded ... ")
//                            }
//                    }
//                }.padding(30)
//            }
//        }
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
