//
//  PostDetailView.swift
//  WeiboDemo
//
//  Created by Yujun Zhao on 12/30/22.
//

import SwiftUI

struct PostDetailView: View {
    let post: Post
    
    var body: some View {
        List {
            PostCell(post: post)
            ForEach(1...10, id: \.self) { i in
                Text("评论\(i)")
            }
        }
        .listRowInsets(EdgeInsets())
        .listStyle(.plain)
        .navigationBarTitle("详情", displayMode: .inline)
    }
}

struct PostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PostDetailView(post: postList.list[0])
    }
}
