//
//  ProfileSummary.swift
//  Landmarks
//
//  Created by Alex Ho on 5/11/21.
//

import SwiftUI

struct ProfileSummary: View {
    @EnvironmentObject var modelData: ModelData
    var user: User
    
    var body: some View {
       
        List{
            Text("Username: \(user.username)")

                .bold()

                

//         Text("Email: \(user.email)")
//                       Text("Notifications: \(user.prefersNotifications ? "On": "Off" )")

        

//                       Text("Goal Date: ") + Text(profile.goalDate, style: .date)

//         Divider()


//                    VStack(alignment: .leading) {
//
//                        Text("Completed Badges")
//
//                            .font(.headline)
//
//
//                        ScrollView(.horizontal) {
//
//                            HStack {
//
//                                HikeBadge(name: "First Hike")
//
//                                HikeBadge(name: "Earth Day")
//
//                                    .hueRotation(Angle(degrees: 90))
//
//                                HikeBadge(name: "Tenth Hike")
//
//                                    .grayscale(0.5)
//
//                                    .hueRotation(Angle(degrees: 45))
//
//                            }
//
//                            .padding(.bottom)
//
//                        }
//
//                    }
//
//
//                    Divider()
//
//
//                                   VStack(alignment: .leading) {
//
//                                       Text("Recent Hikes")
//
//                                           .font(.headline)
//
//
//                                       HikeView(hike: modelData.hikes[0])
//
//                                   }
       
        }
                        
                       
                   
        
            
    }
}

//struct ProfileSummary_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileSummary(user: User.default)
//            .environmentObject(ModelData())
//    }
//}
