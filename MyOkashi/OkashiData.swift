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
    } // end searchOkashi
} // end OkashiData
