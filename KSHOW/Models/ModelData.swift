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
import ObjectMapper

final class ModelData: ObservableObject{
    
    @Published var landmarks: [Landmark] = load("landmarkData.json")
    var hikes: [Hike] = load("hikeData.json")
    @Published var profile = Profile.default
    
    
    var features: [Landmark] {

            landmarks.filter { $0.isFeatured }

        }


    var categories: [String: [Landmark]] {

           Dictionary(

               grouping: landmarks,

               by: { $0.category.rawValue }

           )

       }

}

func load<T:Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Couldn't find \(filename) in main bundle")
    }
    
    do{
       
        
        data = try Data(contentsOf: file)
        
    }catch{
        fatalError("Couldn't find \(filename) in main bundle: \(error)")

    }
    
    do{
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }catch{
        fatalError("Couldn't parse \(filename) as \(T.self)\n\(error)")
    }
}

func loadUserData<T:Decodable>() -> T {
    var data: Data?
    let ref = Database.database().reference()
    if let userId = Auth.auth().currentUser?.uid.description
    {
        
        ref.child("users").child(userId).observeSingleEvent(of: .value, with: { (snapshot) in
        print("Getting data")
        // Get user value
           

//        print("jsondata: \(value!)")
        
        //let user = User(username: username)
        
    }) { (error) in
        print("Can not access data")
        print(error.localizedDescription)
    }
    }
    
   
    
    do{
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }catch{
        fatalError("Couldn't parseas \(T.self)\n\(error)")
    }
      
}


