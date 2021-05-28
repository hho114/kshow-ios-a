//
//  GlobalHelper.swift
//  KSHOW
//
//  Created by Alex Ho on 5/25/21.
//

import Foundation
import SwiftUI






extension LinearGradient {
    static let blackTopToBottom = LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.0), Color.black.opacity(0.95)]), startPoint: .top, endPoint: .bottom)
}

extension Color {
    static let graySearchBackground = Color("gray_search_background")
    static let graySearchText = Color("gray_search_text")
}
