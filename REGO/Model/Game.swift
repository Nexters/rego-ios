//
//  GameEntity.swift
//  REGO
//
//  Created by kokojong on 1/25/24.
//

import Foundation

struct Game: Codable, Hashable {
    var id = UUID() // hashable
    let name: String
    let type: String // TODO: enum
    let descriptionType: String
}
