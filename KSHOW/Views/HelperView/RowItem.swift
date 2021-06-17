//
//  RowItem.swift
//  KSHOW
//
//  Created by Alex Ho on 6/16/21.
//


import SwiftUI
import Kingfisher


struct RowItem: View {
    
    var imageUrl: String
    var name: String
    
    var body: some View {
        
        HStack {
            KFImage(URL(string: imageUrl)!).resizable().frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Text(name)
            Spacer()
//            if landmark.isFavorite
//            {
//                Image(systemName: "star.fill").foregroundColor(.yellow)
//            }
        }
    }
}
