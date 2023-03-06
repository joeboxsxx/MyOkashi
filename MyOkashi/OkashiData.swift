//
//  OkashiData.swift
//  MyOkashi
//
//  Created by 戸上健太 on 2023/03/07.
//

import Foundation

// お菓子データ検索用クラス
class OkashiData: ObservableObject {
    // Web API検索用メソッド 第一引数：keyword 検索したいキーワード
    func searchOkashi(keyword: String) {
        // デバックエリアに出力
        print("searchOkashiメソッドで受け取った値：\(keyword)")
        
        // Taskは非同期で処理を実行できる
        Task {
            // ここから先は非同期で処理される
            // 非同期でお菓子を検索する
            await search(keyword: keyword)
        } // end Task
    } // end searchOkashi
    
    // 非同期でお菓子データを取得
    private func search(keyword: String) async {
        // お菓子の検索キーワードをURLエンコードする
        guard let keyword_encode = keyword.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return
        }
        
        // リクエストURLの組み立て
        guard let req_url = URL(string: "https://sysbird.jp/toriko/api/?apikey=guest&keyword=\(keyword_encode)&max=10&order=r") else {
            return
        }
        // デバックエリアに出力
        print(req_url)
    } // end search
} // end OkashiData
