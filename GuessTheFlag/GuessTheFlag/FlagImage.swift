//
//  FlagImage.swift
//  GuessTheFlag
//
//  Created by Jordan Fraughton on 8/18/24.
//

import SwiftUI

struct FlagImage: View {
    let name: String
    
    var body: some View {
        Image(name)
            .clipShape(.capsule)
            .shadow(radius: 5)
    }
}

#Preview {
    FlagImage(name: "France")
}
