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
        } // end VStack
    } // end body
} // end ContentView

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
