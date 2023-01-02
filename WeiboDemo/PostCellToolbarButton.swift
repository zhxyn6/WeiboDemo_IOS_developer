//
//  PostCellToolbarButton.swift
//  WeiboDemo
//
//  Created by Yujun Zhao on 12/27/22.
//

import SwiftUI

struct PostCellToolbarButton: View {
    let image: String
    let text: String
    let color: Color
    let action: () -> Void // closure, function, 没有输入参数也没有返回值
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 5) {
                Image(systemName: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 18, height: 18)
                Text(text)
                    .font(.system(size: 15))
                
            }
        }
        .foregroundColor(color)
    }
}

struct PostCellToolbarButton_Previews: PreviewProvider {
    static var previews: some View {
        PostCellToolbarButton(image: "heart", text: "点赞", color: .red) {
            print("点赞")
        }
    }
}
