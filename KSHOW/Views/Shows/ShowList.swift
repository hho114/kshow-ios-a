//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Alex Ho on 4/30/21.
//

import SwiftUI

struct ShowList: View {
    
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
//    var filteredLandmarks: [Landmark]{
//        modelData.landmarks.filter{
//            landmark in (!showFavoritesOnly || landmark.isFavorite)
//        }
//    }
    
    var body: some View {
        NavigationView {
            VStack {
                List{
    //                Toggle(isOn: $showFavoritesOnly, label: {
    //                    Text("Favorites only")
    //                })
                    ForEach(modelData.shows)
                    {show in
                    NavigationLink(destination: ShowDetailView(show: show)){
                            ShowRow(show: show)
                        
                        }
                    }
                }
            }
            .navigationBarTitle("")
                    .navigationBarHidden(true)
        }
    }
}

//struct LandmarkList_Previews: PreviewProvider {
//    static var previews: some View {
//        
//        ShowList().environmentObject(ModelData())
//        
//
////        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self){
////            deviceName in
////            LandmarkList().previewDevice(PreviewDevice(rawValue: deviceName)).previewDisplayName(deviceName)
////        }
//        
//    }
//}
