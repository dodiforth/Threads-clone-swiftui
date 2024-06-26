//
//  PreviewProvider.swift
//  ThreadsClone
//
//  Created by Dowon Kim on 26/06/2024.
//

import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}

class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    let user = User(id: NSUUID().uuidString, fullname: "Dowon Kim", email: "dowonkim@me.com", username: "dowonkim")
}
