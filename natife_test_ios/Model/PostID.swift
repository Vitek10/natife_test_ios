//
//  PostID.swift
//  natife_test_ios
//
//  Created by Разработчик on 07.04.2022.
//

import Foundation

struct SpecificPost: Codable {
    let post: PostID
}
// MARK: - Post
struct PostID: Codable {
    let postId: Int
    let title: String
    let text: String
    let images: [String]}
