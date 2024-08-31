//
//  String-EmptyChecking.swift
//  CupcakeCorner
//
//  Created by Jordan Fraughton on 8/31/24.
//

import Foundation

extension String {
    var isReallyEmpty: Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
