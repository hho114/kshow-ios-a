//
//  PlayButton.swift
//  KSHOW
//
//  Created by Alex Ho on 5/25/21.
//

import SwiftUI

struct PlayButton: View {
    var text: String
    var imageName: String
//    var backgroundColor: Color = .white
    
    var action: () -> Void
    var body: some View {
        Button(action: action, label: {
            HStack {
                Spacer()
                Image(systemName: imageName)
                    .font(.headline)
                
                Text(text)
                    .font(.system(size: 16))
                    .bold()
                Spacer()
            }
            .padding(.vertical, 6)
//            .background(Color(UIColor.systemBlue))
            .background(LinearGradient.bluePurple)
            .foregroundColor(Color(UIColor.label))
            .shadow(radius: 10.0)
            .cornerRadius(3.0)
        })
    }
}

//struct WhiteButton_Previews: PreviewProvider {
//    static var previews: some View {
//        ZStack {
//            Color.black
//                .edgesIgnoringSafeArea(.all)
//            PlayButton(text: "Play", imageName: "play.fill") {
//                print("Tapped")
//            }
//        }
//    }
//}

