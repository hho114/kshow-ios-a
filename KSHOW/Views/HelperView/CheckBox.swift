//
//  CheckBox.swift
//  KSHOW
//
//  Created by Alex Ho on 6/16/21.
//

import SwiftUI

struct CheckBox: View {
    @Binding var checked: Bool

    var body: some View {
        Image(systemName: checked ? "checkmark.square.fill" : "square")
            .resizable()
            .scaledToFit()
            .frame(width: 20)
            .foregroundColor(checked ? Color(UIColor.systemBlue) : Color.secondary)
            .onTapGesture {
                self.checked.toggle()
            }
    }
}
