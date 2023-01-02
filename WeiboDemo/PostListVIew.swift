//
//  PostListVIew.swift
//  WeiboDemo
//
//  Created by Yujun Zhao on 12/29/22.
//

import SwiftUI

struct PostListVIew: View {
    let category: PostListCategory
    
    var postList: PostList {
        switch category {
        //最好写一个default情况
        case .recommend:
            return loadPostListData("PostListData_recommend_1.json")
        case .hot:
            return loadPostListData("PostListData_hot_1.json")
        }
    }

    
    var body: some View {
        /*
        // 方法一：foreach
        List {
            ForEach(postList.list) { post in
                PostCell(post: post)
                    .listRowInsets(EdgeInsets())
            }
        }
        .listStyle(.plain)
        */
        
        // 方法二：网上其他人用的
        // listRowInserts不起作用 左右两侧边框宽 少显示了很多，listStyle有效
        List(postList.list, id: \.id) { post in
            ZStack {
                PostCell(post: post)
                // 导航链接，点击之后可以转到详情页面
                NavigationLink(destination: PostDetailView(post: post)) {
                    EmptyView()
                }
                .opacity(0)
//                .hidden()
            }
            .listRowInsets(EdgeInsets())
        }
        .listStyle(.plain)
    }
}

struct PostListVIew_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PostListVIew(category: .recommend)
                .navigationBarTitle("Title")
                .navigationBarHidden(true)
        }
    }
}
