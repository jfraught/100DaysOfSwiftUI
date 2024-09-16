//
//  Card.swift
//  Flashzilla
//
//  Created by Jordan Fraughton on 9/12/24.
//

import Foundation

struct Card: Codable, Equatable, Hashable, Identifiable {
    var id = UUID()
    var prompt: String
    var answer: String
    
    static let example = Card(prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
}
