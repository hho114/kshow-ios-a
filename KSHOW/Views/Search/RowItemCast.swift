//
//  RowItemCast.swift
//  KSHOW
//
//  Created by Alex Ho on 6/23/21.
//

import SwiftUI
import Kingfisher

struct RowItemCast: View {
//    var imageUrl: String
//    var name: String
    var cast: Cast
    @State var isPresented: Bool = false
    var body: some View {
        Button(action: {
            isPresented = true
            UIImpactFeedbackGenerator(style: .soft).impactOccurred()
        }, label: {
            HStack {
                KFImage(URL(string: cast.imageUrl)!).resizable().frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text(cast.name).font(.system(size: 20, weight: .black, design: .rounded)).foregroundColor(Color(UIColor.label))
                Spacer()

            }
            .padding()
        })
        .sheet(isPresented: $isPresented, content: {
            CastProfile(cast: cast, isPresented: $isPresented)

        })
    }
}
