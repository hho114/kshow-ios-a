//
//  SmallVerticalButton.swift
//  KSHOW
//
//  Created by Alex Ho on 5/25/21.
//

import SwiftUI

struct SmallVerticalButton: View {
    var isOn: Bool
    var text: String
    var imageForSelected: String
    var imageForNonSelected: String
//    var color: Color = Color.white
    
    private var imageName: String {
         isOn ? imageForSelected : imageForNonSelected
    }
    
    var action: () -> Void
    var body: some View {
        Button(action: {
            action()
        }, label: {
            VStack(spacing: 6) {
                Image(systemName: imageName)
//                    .foregroundColor(color)
                Text(text)
//                    .foregroundColor(color)
                    .font(.system(size: 14))
                    .bold()
            }
        })
    }
}

//struct SmallVerticalButton_Previews: PreviewProvider {
//    static var previews: some View {
//        ZStack {
//            Color.black
//                .edgesIgnoringSafeArea(.all)
//            SmallVerticalButton(isOn: true, text: "My List", imageForSelected: "checkmark", imageForNonSelected: "plus") {
//                print("action")
//            }
//        }
//    }
//}
