//
//  Post.swift
//  natife_test_ios
//
//  Created by Разработчик on 25.03.2022.
//

import Foundation

struct Welcome: Codable {
    let posts: [Post]
}

struct Post: Codable {
    let postId: Int
    let timeshamp: Int
    let title: String
    let preview_text: String
    let likes_count: Int
}
