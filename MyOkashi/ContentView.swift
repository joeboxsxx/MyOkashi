//
//  ContentView.swift
//  MyOkashi
//
//  Created by 戸上健太 on 2023/03/07.
//

import SwiftUI

struct ContentView: View {
    // OkashiDataを参照する状態変数
    @StateObject var okashiDataList = OkashiData()
    // 入力された文字列を保持する状態変数
    @State var inputText = ""
    
    var body: some View {
        VStack {
            // 文字を受け取るTextFieldを表示する
            TextField("キーワード",
                      text: $inputText,
                      prompt: Text("キーワードを入力してください"))
            .onSubmit {
                // 入力完了直後に検索をする
                okashiDataList.searchOkashi(keyword: inputText)
            } // end .onSubmit
            // キーボードの改行を検索に変更する
            .submitLabel(.search)
            // 上下左右に空白を空ける
            .padding()
            
            // リスト表示する
            List(okashiDataList.okashiList) { okashi in
                // 1つ1つ要素を取り出す
                // Listの表示内容を生成する
                HStack {
                    // 画像を読み込み、表示する
                    AsyncImage(url: okashi.image) { image in
                        // 画像を表示する
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(height: 40)
                    } placeholder: {
                        // 読み込み中はインジケーターを表示する
                        ProgressView()
                    }
                    
                    Text(okashi.name)
                } // end HStack
            } // end List
        } // end VStack
    } // end body
} // end ContentView

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
