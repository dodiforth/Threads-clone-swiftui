//
//  User.swift
//  ThreadsClone
//
//  Created by Dowon Kim on 25/06/2024.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let fullname: String
    let email: String
    let username: String
    var profileImageUrl: String?
    var bio: String?
}
