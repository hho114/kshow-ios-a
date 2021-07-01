//
//  CastCell.swift
//  KSHOW
//
//  Created by Alex Ho on 5/25/21.
//

import SwiftUI
import Kingfisher

struct CastCell: View {
    
    var cast : Cast
    let colors: [Color] = [.yellow, .red, .gray, .green, .pink, .blue, .orange]
    @State var isPresented: Bool = false
    @EnvironmentObject var modelData: ModelData
    var body: some View {
        
        Button(action: {
            isPresented = true
            UIImpactFeedbackGenerator(style: .soft).impactOccurred()
        }, label: {
            KFImage(URL(string:cast.imageUrl))
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(lineWidth: 3)
                        .foregroundColor(colors.randomElement())
            )
        }).sheet(isPresented: $isPresented, content: {
            CastProfile(cast: cast, isPresented: $isPresented).environmentObject(modelData)
        })
            
            

        
    }
}

//struct MoviePreviewCell_Previews: PreviewProvider {
//    static var previews: some View {
//        ZStack {
//            Color.black
//                .edgesIgnoringSafeArea(.all)
//            MoviePreviewCell(movie: exampleMovie1)
//                .frame(width: 200, height: 50)
//        }
//    }
//}
