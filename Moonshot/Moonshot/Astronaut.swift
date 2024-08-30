//
//  Astronaut.swift
//  Moonshot
//
//  Created by Jordan Fraughton on 8/27/24.
//

import Foundation

struct Astronaut: Codable, Identifiable, Hashable {
    let id: String
    let name: String
    let description: String
}
