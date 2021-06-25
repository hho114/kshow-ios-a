//
//  RowItemShow.swift
//  KSHOW
//
//  Created by Alex Ho on 6/23/21.
//

import SwiftUI
import Kingfisher

struct RowItemShow: View {
//    var imageUrl: String
//    var name: String
    var show: Show
    @State var isPresented: Bool = false
    var body: some View {
        Button(action: {
            isPresented = true
            UIImpactFeedbackGenerator(style: .soft).impactOccurred()
        }, label: {
            HStack {
                KFImage(URL(string: show.thumbnailImageUrl)!).resizable().frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text(show.name).font(.system(size: 20, weight: .black, design: .rounded)).foregroundColor(Color(UIColor.label))
                Spacer()

            }
            .padding()
        })
        .sheet(isPresented: $isPresented, content: {
            ShowDetailView(show: show, isPresented: $isPresented)

        })
    }
}

