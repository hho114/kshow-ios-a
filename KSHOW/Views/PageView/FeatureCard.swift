//
//  FeatureCard.swift
//  Landmarks
//
//  Created by Alex Ho on 5/12/21.
//

import SwiftUI
import Kingfisher

struct FeatureCard: View {

//    var landmark: Landmark
    var show: Show

    var body: some View {

//        landmark.featureImage?
//
//            .resizable()
//
//            .aspectRatio(3 / 2, contentMode: .fit)
//            .overlay(TextOverlay(landmark: landmark))
//        NavigationView{
//            NavigationLink(destination: ShowDetailView(show: show)){
                KFImage(URL(string: show.thumbnailImageUrl)!).resizable()
                            .aspectRatio(3 / 2, contentMode: .fit)
                    .overlay(TextOverlay(show: show))
//            }
            
//        }
        
    }

}

struct TextOverlay: View {

//    var landmark: Landmark
    var show: Show

    var gradient: LinearGradient {

        LinearGradient(

            gradient: Gradient(

                colors: [Color.black.opacity(0.6), Color.black.opacity(0)]),

            startPoint: .bottom,

            endPoint: .center)

    }


    var body: some View {

        ZStack(alignment: .bottomLeading) {

            Rectangle().fill(gradient)

            VStack(alignment: .leading) {

                Text(show.name)

                    .font(.title)

                    .bold()

                Text(show.name)

            }

            .padding()

        }

        .foregroundColor(.white)

    }

}

//struct FeatureCard_Previews: PreviewProvider {
//
//    static var previews: some View {
//
//        FeatureCard(landmark: ModelData().features[0])
//
//    }
//
//}
