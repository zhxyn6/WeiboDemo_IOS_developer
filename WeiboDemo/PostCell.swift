//
//  Postcell.swift
//  WeiboDemo
//
//  Created by Yujun Zhao on 12/27/22.
//

import SwiftUI

struct PostCell: View {
    let post: Post
    
    var body: some View {
        VStack (alignment: .leading, spacing: 10){
            HStack(spacing: 5){
                post.avatarImage
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .overlay(
                        PostVIPbadge(vip: post.vip)
                            .offset(x:16, y:16)
                    )
                
                VStack(alignment: .leading , spacing: 5) {
                    Text(post.name)
                        .font(Font.system(size:16))
                        .foregroundColor(Color(red: 242/355, green: 99/255, blue: 4/255))
                        .lineLimit(1)
                    Text(post.date)
                        .font(.system(size: 11))
                        .foregroundColor(.gray)
                }
                .padding(.leading, 10)
                
                if !post.isFollowed {
                    Spacer()
                    
                    Button(action: {
                        print("Click follow button")
                    }) {
                        Text("关注")
                            .font(.system(size:14))
                            .foregroundColor(.orange)
                            .frame(width: 50, height: 26) // 增大 按钮的点击区域
                            .overlay(
                                RoundedRectangle(cornerRadius: 13)
                                    .stroke(Color.orange, lineWidth: 1)
                            )
                    }
                }
                
            }
            
            Text(post.text)
                .font(.system(size: 17))
                
            if !post.images.isEmpty {
//                loadImage(name: post.images[0])
                PostImageCell(images: post.images, width: UIScreen.main.bounds.width - 30)
                
            }
            
            Divider()
            
            HStack(spacing: 0) {
                Spacer()
                
                PostCellToolbarButton(image: "message",
                                      text: post.commentCountText,
                                      color: .black)
                {
                    print("Click comment button")
                }
                
                Spacer()
                
                PostCellToolbarButton(image: "heart",
                                      text: post.likeCountText,
                                      color: .black)
                {
                    print("Click like button")
                }
                
                Spacer()
                
            }
            
            Rectangle()
                .padding(.horizontal, -15)
                .frame(height: 10)
                .foregroundColor(Color(red: 238/255, green: 238/255, blue: 238/255))
        }
        .padding(.horizontal, 15)
        .padding(.top, 15)
                       
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        PostCell(post: postList.list[0])
    }
}
