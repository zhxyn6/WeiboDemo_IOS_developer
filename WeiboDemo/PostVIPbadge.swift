//
//  PostVIPbadge.swift
//  WeiboDemo
//
//  Created by Yujun Zhao on 12/27/22.
//

import SwiftUI

struct PostVIPbadge: View {
    let vip: Bool
    var body: some View {
        Group {
            if vip {
                Text("V")
                    .bold()
                    .font(.system(size: 11))
                    .foregroundColor(.yellow)
                    .frame(width: 15, height: 15)
                    .background(Color.red)
                    .clipShape(Circle())
                    .overlay(
                        RoundedRectangle(cornerRadius: 7.5)
                            .stroke(Color.white, lineWidth: 1)
                    )
            }
        
        }
        
        
    }
}

struct PostVIPbadge_Previews: PreviewProvider {
    static var previews: some View {
        PostVIPbadge(vip: true)
    }
}
