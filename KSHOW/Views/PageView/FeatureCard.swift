//
//  FeatureCard.swift
//  Landmarks
//
//  Created by Alex Ho on 5/12/21.
//

import SwiftUI
import Kingfisher

struct FeatureCard: View {

    @EnvironmentObject var modelData: ModelData
    var show: Show
    @State var isPresent: Bool = false
    var body: some View {


        Button(action: {
            isPresent = true
            UIImpactFeedbackGenerator(style: .soft).impactOccurred()
        }, label: {
            KFImage(URL(string: show.thumbnailImageUrl)!).resizable()
                .aspectRatio(1.5, contentMode: .fit)
                .overlay(TextOverlay(show: show))
        }).sheet(isPresented: $isPresent, content: {
            ShowDetailView(show: show, isPresented: $isPresent).environmentObject(modelData)
        })
                

        
    }

}

struct TextOverlay: View {

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


                    .font(.system(size: 24, weight: .black, design: .rounded))
                if let ep = show.currentEpisode["ep"]{
                    Text("Lastest Episode: \(ep)")
                }
               

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
