// 출처 : 프로그래머스 연습문제 귤 고르기
// https://programmers.co.kr/learn/courses/30/lessons/138476
// 풀이 : hogumachu

import Foundation

func solution(_ k: Int, _ tangerine: [Int]) -> Int {
    var tangerineCount: [Int: Int] = [:]
    var result = 0
    var currentValue = 0
    
    tangerine.forEach {
        if tangerineCount[$0] == nil {
            tangerineCount[$0] = 1
        } else {
            tangerineCount[$0]! += 1
        }
    }
    
    let sortedTangerine = tangerine.sorted {
        if tangerineCount[$0]! == tangerineCount[$1]! {
            return $0 > $1
        } else {
            return tangerineCount[$0]! > tangerineCount[$1]!
        }
    }
    
    for i in 0..<k {
        if currentValue != sortedTangerine[i] {
            currentValue = sortedTangerine[i]
            result += 1
        }
    }
    
    return result
