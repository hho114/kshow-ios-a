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
    
//    @Published var landmarks: [Landmark] = load("landmarkData.json")
//    var hikes: [Hike] = load("hikeData.json")
//    @Published var profile = Profile.default
//    @Published var ref = Database.database(url: "https://kshow-product.firebaseio.com/").reference()
//    @Published var api = "https://kshow-product.firebaseio.com/"
    @Published var ref = Database.database().reference()
    @Published var user = User.default
    @Published var shows : [Show] = []
    @Published var historyEpisodes: [HistoryEpisode] = []
    @Published var episodes : [Episode] = []
    @Published var currentSelectedShow : Show = Show.default
//    @Published var show = Show.default
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
    
    var currentImageCasts: [Cast] {
        var newListCasts : [Cast] = []
        for cast in casts {
//            var tempCast = cast
            if currentSelectedShow.casts.contains(cast.id) {
                newListCasts.append(cast)
            }
            
        }
            return newListCasts
        }
//    var features: [Landmark] {
//
//          let shows =  landmarks.filter { $0.isFeatured }
//        print("show feature filter: \(shows)")
//        return shows
//
//        }


//    var categories: [String: [Landmark]] {
//
//           Dictionary(
//
//               grouping: landmarks,
//
//               by: { $0.category.rawValue }
//
//           )
//
//       }
    
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

//func load<T:Decodable>(_ filename: String) -> T {
//    let data: Data
//
//    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
//        fatalError("Couldn't find \(filename) in main bundle")
//    }
//
//    do{
//
//
//        data = try Data(contentsOf: file)
//
//    }catch{
//        fatalError("Couldn't find \(filename) in main bundle: \(error)")
//
//    }
//
//    do{
//        let decoder = JSONDecoder()
//        return try decoder.decode(T.self, from: data)
//    }catch{
//        fatalError("Couldn't parse \(filename) as \(T.self)\n\(error)")
//    }
//}

//func loadUserData<T:Decodable>() -> T {
//    var data: Data
//    let userID = Auth.auth().currentUser?.uid
//    let ref = Database.database().reference()
//    ref.child("users").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
//      // Get user value
////      let value = snapshot.value as? NSDictionary
////      let username = value?["username"] as? String ?? ""
////      let user = User(username: username)
//        guard let value = snapshot.value as? [String: Any] else { return }
//                do {
//                    data = try JSONSerialization.data(withJSONObject: value, options: [])
////                    let user = try JSONDecoder().decode(T.self, from: jsonData)
////                    print(user)
//                   
//
//                } catch let error {
//                    print(error)
//                }
//
//     
//      }) { (error) in
//        print(error.localizedDescription)
//    }
//    
//    do{
//        let decoder = JSONDecoder()
//        return try decoder.decode(T.self, from: data)
//    }catch{
//        fatalError("Couldn't parse as \(T.self)\n\(error)")
//    }
//
//      
//}


