//
//  Post.swift
//  StaggeredGrid
//
//  Created by GYURI PARK on 2023/08/29.
//

import Foundation

struct Post: Identifiable, Hashable {
    var id = UUID().uuidString
    var imageURL: String
}
