//
//  Post.swift
//  WeiboDemo
//
//  Created by Yujun Zhao on 12/27/22.
//

import SwiftUI

struct PostList: Codable {
    var list: [Post]
}

// Post is a data model
/*
 Codable: 可以从json文件转换过来，也可以转换成json文件
 Identifiable: ID为primary key
 */
struct Post: Codable, Identifiable {
    // Properties 固定属性为let，可变属性为var
    // 以下列出来的数据及其类型都要在 json文件中 有与之对应的
    let id: Int
    let avatar: String // 头像
    let vip: Bool // True or False
    let name: String
    let date: String
    
    var isFollowed: Bool
    
    let text: String
    let images: [String] // 一条post可以包含不止一张图片
    
    var commentCount: Int
    var likeCount: Int
    var isLiked: Bool
}

extension Post {
    // calculated property 只读属性，能读取到一个值，但是不能复制
    var commentCountText: String {
        if commentCount <= 0 { return "评论"}
        if commentCount < 1000 { return "\(commentCount)"}
        return String(format: "%.1fk", Double(commentCount) / 1000)
    }
    
    var likeCountText : String {
        if likeCount <= 0 { return "点赞"}
        if likeCount < 1000 { return "\(likeCount)"} 
        return String(format: "%.1fk", Double(likeCount) / 1000)
    }
    
    var avatarImage: Image{
        return loadImage(name: avatar)
    }
}

/* 全局常量
 You can define it in any file and can access it in current module anywhere.
 So you can define it somewhere in the file outside of any scope.
 There is no need for static and all global variables are computed lazily.
 */
 let postList = loadPostListData("PostListData_recommend_1.json")

// 通过filemane获得URL，通过解析url获得data，这个data就是json文件
func loadPostListData(_ filename: String) -> PostList{ // 解析微博数据文件
    // 局部变量
    guard let url = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Can not find \(filename) in main bundle")
    }
    guard let data = try? Data(contentsOf: url) else {
        fatalError("Can nor load \(url)")
    }
    guard let list = try? JSONDecoder().decode(PostList.self, from: data) else {
        fatalError("Can not parse post list json data") // 无法解析json数据
    }
    return list
}

// 知道微博名字，直接生成对应图片
func loadImage(name: String) -> Image {
    return Image(uiImage: UIImage(named: name)!)
}
