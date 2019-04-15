//
//  CounterViewModel.swift
//  RxPractice
//
//  Created by 内田 大輔 on 2019/04/10.
//  Copyright © 2019 Sue1215. All rights reserved.
//
///         ・カウントデータの保持
///         ・カウントアップ、カウントダウン、カウントリセットの処理

class CounterViewModel {
    private(set) var count = 0
    
    func incrementCount(callback: (Int) -> ()) {
    count += 1
    callback(count)
    }
    
    func decrementCount(callback: (Int) -> ()) {
        count -= 1
        callback(count)
    }
    
    func resetCount(callback: (Int) -> ()) {
        count = 0
        callback(count)
    }
}
