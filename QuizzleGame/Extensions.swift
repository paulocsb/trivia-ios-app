//
//  Extensions.swift
//  QuizzleGame
//
//  Created by @paulocsb.
//

import Foundation
import SwiftUI

// Custom modifier to call this one-liner instead of adding three modifiers every time we create a title Text.
extension Text {
    func lilacTitle() -> some View {
        self.font(.title)
            .fontWeight(.heavy)
            .foregroundColor(Color("Grey50"))
    }
}
