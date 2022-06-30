//
//  HomeView.swift
//  Peter009_1
//
//  Created by DONG SHENG on 2022/6/28.
//

import SwiftUI

class HomeViewModel: ObservableObject{
    
    @Published var text: String = "你有什麼煩惱呢 ?"
    @Published var userSays: String = ""
    
    let food: [String] = [
        "來一客 16盎司的牛排吧！","你可以點個 咖哩拌飯" , "來碗滷肉飯 如何" , "你可以吃 奶油培根義大利麵" , "可以來一份蚵仔煎 不加蚵仔"
    ]
    let ache: [String] = [
        "我看起來像醫生嗎", "問問醫生可能比較好"
    ]
    
    let unknown: [String] = [
        "這個問題太艱深了 我無法回答" , "無可奉告" , "聽不懂😭"
    ]
    
    let greet: [String] = [
        "你好😎" , "哈摟～～" , "三哇滴咖" , "歐嗨呦" , "哩厚"
    ]
    
    let mate: [String] = [
        "有可能明天下午" , "大概快了" , "一年內！" , "五年內"
    ]
    
    func response(){
        
        // 要注意contains 的 用法
        if self.userSays.contains(where: { $0 == "吃" || $0 == "食" || $0 == "餐"  || $0 == "餓"}){
            self.text = food.randomElement() ?? "吃 💩"
        } else if self.userSays.contains(where: { $0 == "傷" || $0 == "病" || $0 == "痛"  || $0 == "暈" }){
            self.text = ache.randomElement() ?? "有病請看醫生🤬"
        } else if self.userSays.contains(where: { $0 == "笨" || $0 == "蠢" }){
            self.text = "喔是喔"
        } else if self.userSays.contains(where: { $0 == "婚" || $0 == "朋" }){
            self.text = mate.randomElement() ?? "明天早上"
        } else if self.userSays.contains(where: { $0 == "獎" || $0 == "透" || $0 == "票"}){
            self.text = "天機不可洩漏 👻"
        } else if self.userSays == "你好"{
            self.text = greet.randomElement() ?? "Hello World"
        } else if self.userSays == "這麼帥"{
            self.text = "請你再去照一次鏡子🥴"
        } else if self.userSays == "聰明"{
            self.text = "可能我是最聰明的!"
        } else if self.userSays == "呆"{
            self.text = "SBBB"
        } else {
            self.text = unknown.randomElement() ?? "請問其他問題"
        }
        
        self.userSays = ""
    }
}

struct HomeView: View {
    
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        ZStack {
            Color(red: 216 / 255, green: 242 / 255, blue: 218 / 255).ignoresSafeArea()
            
            Image("Image1")
                .resizable()
                .scaledToFit()
            
            Image("Image2")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300 ,alignment: .leading)
            
            VStack{
                Text(viewModel.text)
                    .font(.largeTitle)
                    .padding(.top ,10)
                
                Spacer()
                
                TextField("Ex: 想吃什麼", text: $viewModel.userSays)
                    .padding()
                    .background(.white)
                    .padding()
                    .foregroundColor(.purple)
                
                Button {
                    viewModel.response()
                } label: {
                    Text("Help !")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color(red:  138 / 255, green: 154 / 255 , blue: 139 / 255))
                        .cornerRadius(8)
                }
            }
            .padding()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
