//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Alex Ho on 5/11/21.
//

import SwiftUI

struct ProfileHost: View {
    @Environment(\.editMode) var editMode
    @EnvironmentObject var modelData: ModelData
//    @State private var draftProfile = Profile.default
    @State private var draftUser = User.default
//    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
       
            VStack(alignment: .leading, spacing: 10) {

                HStack {
//
////                    if editMode?.wrappedValue == .active {
////
////                                        Button("Cancel") {
////
////                                            draftUser = modelData.user
////
////                                            editMode?.animation().wrappedValue = .inactive
////
////                                        }
////
////                                    }
                               Spacer()

                               EditButton()

                        }


                if editMode?.wrappedValue == .inactive {

                               ProfileSummary(user: modelData.user)

                           } else {

                            ProfileEditor(user: $draftUser)
                                .onAppear {

                                                       draftUser = modelData.user

                                                   }

                                                   .onDisappear {

                                                       modelData.user = draftUser

                                                   }

                           }
                

                    }
//            .padding()
          
            
            
            

        
        
    }
    
    
}

//struct ProfileHost_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileHost().environmentObject(ModelData())
//        
//    }
//}
