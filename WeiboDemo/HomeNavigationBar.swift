//
//  HomeNavigationBar.swift
//  WeiboDemo
//
//  Created by Yujun Zhao on 12/30/22.
//

import SwiftUI

private let kLabelWidth: CGFloat = 60
private let kButtomHeight: CGFloat = 24

struct HomeNavigationBar: View {
    // @state: 当前view的一个属性
    @State var leftPercent: CGFloat // 0 for left, 1 for right
    
    var body: some View {
        // 顶部对齐
        HStack(alignment: .top, spacing: 0) {
            Button(action: {
                print("Click camera button")
            }) {
                Image(systemName: "camera")
                    .resizable()
                    .scaledToFit()
                    .frame(width: kButtomHeight, height: kButtomHeight)
                    .padding(.horizontal, 15)
                    .padding(.top, 5)
                    .foregroundColor(.black)
            }
            
            Spacer()
            
            VStack(spacing: 3){
                // 推荐，热门，这两个界面
                HStack(spacing: 0) {
                    Text("推荐")
                        .bold()
                        .frame(width: kLabelWidth, height: kButtomHeight)
                        .padding(.top, 5)
                        .opacity(Double(1 - (leftPercent-0.6) * 0.5))
                    // 橙色小bar根据点击，移动位置
                        .onTapGesture {
                            withAnimation {
                                self.leftPercent = 0.6
                            }
                        }
                    
                    Spacer()
                    
                    Text("热门")
                        .bold()
                        .frame(width: kLabelWidth, height: kButtomHeight)
                        .padding(.top, 5)
                    // 不透明度
                        .opacity(Double(0.5 + (leftPercent-0.6) * 0.5))
                        .onTapGesture {
                            withAnimation {
                                self.leftPercent = 1.6
                            }
                        }
                }
                .font(.system(size: 20))
                
                // 获取当前view的宽高
                GeometryReader { geometry in
                    // 橙色小bar
                    RoundedRectangle(cornerRadius: 2)
                        .foregroundColor(.orange)
                        .frame(width: 30, height: 4)
                        .offset(x: geometry.size.width * (self.leftPercent - 0.5) + kLabelWidth * (0.5 - self.leftPercent))
                }
                .frame(height: 6)
            }
            .frame(width: UIScreen.main.bounds.width * 0.5)
            
            Spacer()
            
            Button(action: {
                print("Click add button")
            }) {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: kButtomHeight, height: kButtomHeight)
                    .padding(.horizontal, 15)
                    .padding(.top, 5)
                    .foregroundColor(.orange)
            }
        }
        // 好像是默认的系统宽度，这句话可以不写
        .frame(width: UIScreen.main.bounds.width)
        
    }
}

struct HomeNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        // 视频里设置为0
        HomeNavigationBar(leftPercent:  0.6)
    }
}
