// 출처 : 프로그래머스 연습문제 할인 행사
// https://programmers.co.kr/learn/courses/30/lessons/131127
// 풀이 : hogumachu

import Foundation

func solution(_ want: [String], _ number: [Int], _ discount: [String]) -> Int {
    var counting = 10
    var wantDictionray: [String: Int] = [:]
    var result = 0
    
    for i in 0..<want.count {
        wantDictionray[want[i]] = number[i]
    }
    
    let wants = wantDictionray
    
    for i in 0..<10 {
        if wantDictionray[discount[i]] != nil {
            if wantDictionray[discount[i]]! > 0 {
                counting -= 1
            }
            wantDictionray[discount[i]]! -= 1
        }
    }
    
    if counting == 0 {
        result += 1
    }
    
    if discount.count == 10 {
        return 0
    }
    
    for i in 0..<discount.count - 10 {
        let append = discount[i]
        let remove = discount[i + 10]
        
        if wantDictionray[append] != nil {
            if wantDictionray[append]! >= 0 {
                counting += 1
            }
            if wants[append]! > wantDictionray[append]! {
                wantDictionray[append]! += 1
            }
        }
        
        if wantDictionray[remove] != nil {
            if wantDictionray[remove]! > 0 {
                counting -= 1
            }
            wantDictionray[remove]! -= 1
        }
        
        if counting == 0 {
            result += 1
        }
    }
    
    return result
}
