////
////  SongListView.swift
////  ItunesAPI
////
////  Created by GYURI PARK on 2023/07/10.
////
//
//import SwiftUI
//
//struct SongListView: View {
//    @StateObject var viewModel = SongListViewModel()
//    
//    var body: some View {
//        NavigationView {
//            List(viewModel.songs) { song in
//                Text(song.collectionName)
//            }
//            .listStyle(.plain)
//            .searchable(text: $viewModel.searchTerm)
//            .navigationTitle("Search Songs")
//        }
//    }
//}
//
//struct SongListView_Previews: PreviewProvider {
//    static var previews: some View {
//        SongListView()
//    }
//}
