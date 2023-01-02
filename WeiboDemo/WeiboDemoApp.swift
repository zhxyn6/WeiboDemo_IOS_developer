//
//  WeiboDemoApp.swift
//  WeiboDemo
//
//  Created by Yujun Zhao on 12/27/22.
//

import SwiftUI

@main
struct WeiboDemoApp: App {
    var body: some Scene {
        WindowGroup {
            PostCell(post: postList.list[0])
        }
    }
}
