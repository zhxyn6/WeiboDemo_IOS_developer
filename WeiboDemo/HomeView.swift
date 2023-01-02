//
//  HomeView.swift
//  WeiboDemo
//
//  Created by Yujun Zhao on 12/31/22.
//

import SwiftUI

struct HomeView: View {
    
    init() {
        // 隐藏默认分割线
        UITableView.appearance().separatorStyle = .none
        // 点击微博不会变灰
        UITableViewCell.appearance().selectionStyle = .none
    }
    
    var body: some View {
        
        
        NavigationView() {
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 0) {
                    PostListVIew(category: .recommend)
                        .frame(width: UIScreen.main.bounds.width)
                    PostListVIew(category: .hot)
                        .frame(width: UIScreen.main.bounds.width)
                }
            }
            // 忽略底部安全区域
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarItems(leading: HomeNavigationBar(leftPercent: 0.6))
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
