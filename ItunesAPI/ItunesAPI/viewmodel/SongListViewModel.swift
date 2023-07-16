////
////  SongListViewModel.swift
////  ItunesAPI
////
////  Created by GYURI PARK on 2023/07/10.
////
//
//import Foundation
//import Combine
//
//// https://itunes.apple.com/search?term=jack+johnson&entity=album&limit=5
//// https://itunes.apple.com/search?term=jack+johnson&entity=song&limit=5
//
//class SongListViewModel: ObservableObject {
//    
//    @Published var searchTerm: String = ""
//    @Published var songs: [Song] = [Song]()
//    
//    let limit: Int = 20
//    
//    var subscriptions = Set<AnyCancellable>()
//    
//    init() {
//        $searchTerm
//            .dropFirst()
//            .debounce(for: .seconds(0.5), scheduler: RunLoop.main)
//            .sink { [weak self] term in
//            self?.fetchAlbums(for: term)
//        }.store(in: &subscriptions)
//    }
//    
//    func fetchAlbums(for searchTerm: String) {
//        
//        guard let url = URL(string: "https://itunes.apple.com/search?term=\(searchTerm)&entity=song&limit=\(limit)") else {
//            return
//        }
//        
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            if let error = error {
//                print("URLSession error: \(error.localizedDescription)")
//            } else if let data = data {
//                do {
//                    let result = try JSONDecoder().decode(SongResult.self, from: data)
//                    DispatchQueue.main.async {
//                        self.songs = result.results
//                    }
//                } catch {
//                    print("decoding error \(error)")
//                }
//            }
//        }.resume()
//    }
//}
