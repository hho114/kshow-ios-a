//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Alex Ho on 5/11/21.
//

import SwiftUI
import FirebaseDatabase

struct ProfileHost: View {
    @Environment(\.editMode) var editMode
    @EnvironmentObject var modelData: ModelData
//    @State private var draftProfile = Profile.default
    @State private var draftUser = User.default
//    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
       
            VStack(alignment: .center, spacing: 10) {
                Label(
                    title: { Text("Profile") },
                    icon: { Image(systemName: "person.crop.circle") }).padding()
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

                    EditButton().padding(.init(top: 10, leading: 0, bottom: 0, trailing: 10))

                        }


                if editMode?.wrappedValue == .inactive {

                               ProfileSummary(user: modelData.user)

                           } else {

                            ProfileEditor(user: $draftUser)
                                .onAppear {

                                                       draftUser = modelData.user

                                                   }

                                                   .onDisappear {
                                                    if modelData.user.username != draftUser.username
                                                    {
                                                        modelData.user = draftUser
                                                        updateUserName()
                                                     
                                                    }
                                                      
                                                   }

                           }
                

                    }
//            .padding()
          
            
            
            

        
        
    }
    
    func updateUserName() {
        modelData.ref.child("users").child(modelData.user.id).updateChildValues(["username": modelData.user.username]) {
          (error:Error?, ref:DatabaseReference) in
          if let error = error {
            bfprint("Username could not be saved: \(error).")
          } else {
            bfprint("Username saved successfully!")
          }
        }

    }
    
}

//struct ProfileHost_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileHost().environmentObject(ModelData())
//        
//    }
//}
