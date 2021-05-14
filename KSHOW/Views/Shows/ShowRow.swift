//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Alex Ho on 4/30/21.
//

import SwiftUI

struct ShowRow: View {
    
    var landmark: Landmark
    
    var body: some View {
        
        HStack {
            landmark.image.resizable().frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Text(landmark.name)
            Spacer()
            if landmark.isFavorite
            {
                Image(systemName: "star.fill").foregroundColor(.yellow)
            }
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks
    static var previews: some View {
        Group {
            ShowRow(landmark: landmarks[0])
            ShowRow(landmark: landmarks[1])
    }.previewLayout(.fixed(width: 300, height: 70))
    }
}
