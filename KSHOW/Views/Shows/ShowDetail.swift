//
//  Detail.swift
//  Landmarks
//
//  Created by Alex Ho on 4/30/21.
//

import SwiftUI
import Kingfisher

struct ShowDetail: View {
    @EnvironmentObject var modelData: ModelData
//    var landmark : Landmark
    var show: Show
    
    var landmarkIndex: Int {
//        modelData.landmarks.firstIndex(where: {$0.id == landmark.id})!
        modelData.shows.firstIndex(where: {$0.id == show.id})!
    }
    
    var body: some View {
        ScrollView {
//            MapView(coordinate: landmark.locationCoordinate).ignoresSafeArea( edges: .top).frame(height:300)
            
//            CircleImage(image: landmark.image).offset(y:-130).padding(.bottom,-130)
            KFImage(URL(string: show.thumbnailImageUrl)!)
            VStack(alignment: .leading) {
                HStack {
//                    Text(landmark.name).font( .title).foregroundColor(.primary)
                    Text(show.name).font( .title).foregroundColor(.primary)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
        
                HStack {
//                    Text(landmark.park)
//                        .font(.subheadline)
                    Text(show.name)
                        .font(.subheadline)
                    Spacer()
//                    Text(landmark.state)
//                        .font(.subheadline)
                    Text(show.name)
                        .font(.subheadline)
                }.font(.subheadline).foregroundColor(.secondary)
                Divider()
//                Text("About \(landmark.name))").font(.title2)
//                Text(landmark.description)
                Text("About \(show.name))").font(.title2)
                Text(show.description)
            }
            .padding(.all)
            Spacer()
        }
        .navigationTitle(show.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

//struct Detail_Previews: PreviewProvider {
//    static let modelData = ModelData()
//    static var previews: some View {
//        ShowDetail(landmark: ModelData().landmarks[0]).environmentObject(modelData)
//    }
//}
