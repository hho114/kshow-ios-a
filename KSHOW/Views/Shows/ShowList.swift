//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Alex Ho on 4/30/21.
//

import SwiftUI

struct LandmarkList: View {
    
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark]{
        modelData.landmarks.filter{
            landmark in (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            List{
                Toggle(isOn: $showFavoritesOnly, label: {
                    Text("Favorites only")
                })
                ForEach(filteredLandmarks)
                {landmark in
                NavigationLink(destination: LandmarkDetail(landmark: landmark)){
               LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmasks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        
        LandmarkList().environmentObject(ModelData())
        
//
//        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self){
//            deviceName in
//            LandmarkList().previewDevice(PreviewDevice(rawValue: deviceName)).previewDisplayName(deviceName)
//        }
        
    }
}
