//
//  ModelData.swift
//  Landmarks
//
//  Created by Alex Ho on 4/30/21.
//

import Foundation
import Combine

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
    
//    let authData = "{email: email , password: password , returnSecureToken: true}"
//    let url = URL(string: "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyAiSWbEUZ-cUyzxO6kzitlV9_BRm4_-8VY&email=email.com&password=123456&returnSecureToken=true")!
//    var request = URLRequest(url: url)
////    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//    request.httpMethod = "POST"
//    URLSession.shared.dataTask(with: request) { data, response, error in
//        // handle the result here.
//        print(response ?? "n/a")
//        print(data ?? "n/a")
//    }.resume()
//   
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
