//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Alex Ho on 4/30/21.
//

import SwiftUI
import Kingfisher
struct ShowRow: View {
    
    var show: Show
    
    
    var body: some View {
        
        HStack {
            KFImage(URL(string: show.thumbnailImageUrl)!).resizable().frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Text(show.name)
            Spacer()

        }
    }
}


