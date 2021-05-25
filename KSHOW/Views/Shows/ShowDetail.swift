//
//  Detail.swift
//  Landmarks
//
//  Created by Alex Ho on 4/30/21.
//

import SwiftUI
import Kingfisher
import CodableFirebase
import FirebaseDatabase

struct ShowDetail: View {
    @EnvironmentObject var modelData: ModelData
//    var landmark : Landmark
//    @State var episodes: [Episode] = []
    var show: Show
    @State var load = true
    var landmarkIndex: Int {
//        modelData.landmarks.firstIndex(where: {$0.id == landmark.id})!
        modelData.shows.firstIndex(where: {$0.id == show.id})!
    }
    
    var body: some View {
        

        KFImage(URL(string: show.thumbnailImageUrl)!).resizable()
            .aspectRatio(contentMode: .fit)
        VStack(alignment: .leading) {
            HStack {
//                    Text(landmark.name).font( .title).foregroundColor(.primary)
                Text(show.name).font( .title).foregroundColor(.primary)
//                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
            }

            HStack {

                Text(show.id)
                    .font(.subheadline)
                Spacer()

                Text(show.name)
                    .font(.subheadline)
            }.font(.subheadline).foregroundColor(.secondary)
            Divider()

            Text("About \(show.name)").font(.title2)
            Text(show.description)
            Divider()
            if !self.load {
                List{
                   
                    ForEach(modelData.episodes)
                    {episode in
                    NavigationLink(destination: EpisodeDetail(episode: episode)){
                            EpisodeRow(episode: episode)
                        
                        }
                    }.listStyle(InsetListStyle()).transition(.slide).animation(.easeInOut(duration: 0.5))
                }
    //            .navigationTitle("Landmasks")
            }
            else
            {
                ProgressView().onAppear{
                    fetchEpisodeList()
                    NotificationCenter.default.addObserver(forName: NSNotification.Name("load"), object: nil, queue: .main) { (_) in
                        
                        self.load = UserDefaults.standard.value(forKey: "load") as? Bool ?? false

                    }
                }
                
            }
            
            
        }
           
    }
    
 func fetchEpisodeList(){
        
        Database.database().reference().child("shows").child(show.id).observe(.value) { snapshot in
            for child in snapshot.children.allObjects as! [DataSnapshot] {
            do {
                let model = try FirebaseDecoder().decode(Episode.self, from: child.value as Any)
                print(model)
                modelData.episodes.append(model)
                UserDefaults.standard.set(false, forKey: "load")
                NotificationCenter.default.post(name: NSNotification.Name("load"), object: nil)
            } catch let error {
                print(error)
            }
                
                
          }
            
        }
    }
}

//struct Detail_Previews: PreviewProvider {
//    static let modelData = ModelData()
//    static var previews: some View {
//        ShowDetail(landmark: ModelData().landmarks[0]).environmentObject(modelData)
//    }
//}
