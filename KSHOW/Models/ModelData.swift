//
//  ModelData.swift
//  Landmarks
//
//  Created by Alex Ho on 4/30/21.
//

import Foundation
import Combine
import FirebaseDatabase
import FirebaseAuth

final class ModelData: ObservableObject{
    

    @Published var ref = Database.database().reference()
    @Published var user = User.default
    @Published var shows : [Show] = []
    @Published var historyEpisodes: [HistoryEpisode] = []
    @Published var currentEpisodes : [Episode] = []
    @Published var currentSelectedShow : Show = Show.default
    @Published var permission = Permission.default
    @Published var casts : [Cast] = []
    @Published var isSignin: Bool = false
    @Published var loading: Bool = false
    
    
    var features: [Show] {

         shows.filter { $0.isFeatured }

        }
    
    var updateImageShowAPI: [Show] {
        var newListShows : [Show] = []
        for show in shows {
            var tempShow = show
            let imageURL = permission.showImageAPI + show.thumbnailImageUrl
            tempShow.thumbnailImageUrl = imageURL
            newListShows.append(tempShow)
        }
            return newListShows
        }
    
    var updateImageCastAPI: [Cast] {
        var newListCasts : [Cast] = []
        for cast in casts {
            var tempCast = cast
            let imageURL = permission.castImageAPI + cast.imageUrl
            tempCast.imageUrl = imageURL
            newListCasts.append(tempCast)
        }
            return newListCasts
        }
    

    var categories: [String: [Show]] {

        var cate: [String: [Show]] = [:]
        for cateType in permission.categoryType {
            var showsAdded: [Show] = []
            for show in shows {
                if show.category.contains(cateType) {
                    showsAdded.append(show)
                }
            }
            cate[cateType] = showsAdded
        }
        
        return cate
       }

}




