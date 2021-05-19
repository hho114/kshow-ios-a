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
    @State private var draftProfile = Profile.default
//    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {

            HStack {

                if editMode?.wrappedValue == .active {

                                    Button("Cancel") {

                                        draftProfile = modelData.profile

                                        editMode?.animation().wrappedValue = .inactive

                                    }

                                }
                           Spacer()

                           EditButton()

                       }


            if editMode?.wrappedValue == .inactive {

                           ProfileSummary(profile: modelData.profile)

                       } else {

                        ProfileEditor(profile: $draftProfile)
                            .onAppear {

                                                   draftProfile = modelData.profile

                                               }

                                               .onDisappear {

                                                   modelData.profile = draftProfile

                                               }

                       }
            

                }

                .padding()
    }
    
    
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost().environmentObject(ModelData())
        
    }
}
